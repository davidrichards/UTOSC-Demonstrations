require 'rubygems'
require 'davidrichards-etl'
require 'etl/active_record_loader'
require 'hpricot'
require 'mechanize'
# require 'marshal'

# This keeps track of the news.  It allows us to look into text analysis.
class UTANewsETL < ActiveRecordLoader
  
  # Start here: 
  # http://www.rideuta.com/mediaRoom/pressReleases.aspx
  
  def extract_file
    "/tmp/uta_news.dat"
  end
  
  def url
    "http://www.rideuta.com/mediaRoom/pressReleases.aspx"
  end
  
  def news_list_doc
    @news_list_doc ||= Hpricot(open(url))
  end
  
  def raw_links
    (news_list_doc/".contentContainer2/table/tbody/tr/td/table/tr/td")
  end
  
  def agent
    return @agent if @agent
    
    @agent = WWW::Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @agent
  end
  
  def main_page
    agent.get(url)
  end
  
  def main_form
    main_page.forms.first
  end

  def link_for(target, argument=nil)
    form = main_form
    # form.fields.find
    require 'rubygems'
    require 'ruby-debug'
    debugger
    1 + 1
  end
  # (news_list_doc/"#aspnetForm").first

  def login
   # marcone_home shouldn't be cached, so this should be atomic
   login_form = marcone_page.form('aspnetForm')
   login_form.fields.find {|field| field.name =~ /UserName/}.value = '80661'
   login_form.fields.find {|field| field.name =~ /Password/}.value = 'iceland1'
   agent.submit(login_form, login_form.buttons.first, {'Referer' => 'http://www.marcone.com/'})
  end
  
  def links
    return @links if @links
    i = 0
    current = OpenStruct.new
    @links = raw_links.inject([]) do |list, e|
      i += 1
      if i % 2 == 1
        current.raw_date = e.inner_html.strip
        current.date = Date.parse(current.raw_date)
      else
        current.raw_href = e.containers.first['href']
        current.raw_href =~ /doPostBack\('(.+)'/
        current.target = $1
        list << current
        current = OpenStruct.new
      end
      list
    end
  end
  
   
  # Get the data out of the main pages of the UTA site and store them locally in a temporary file
  def extract
    @raw = Marshal.load(File.read(extract_file)) if File.exist?(extract_file)
    return true if @raw
    @raw = links
    File.open(extract_file, 'w') {|f| f.write Marshal.dump(links) }
  end
  
  def transform
    @raw = @data.map do |link|
      link_for(link.target)
    end
    @raw.unshift([:some, :labels, :here])
  end
  
  after_load :cleanup_extracted_data
  
  def cleanup_extracted_data
    FileUtils.rm_rf(extract_file)
  end

end

class H < UTANewsETL; end
@h = H.new
@h.process