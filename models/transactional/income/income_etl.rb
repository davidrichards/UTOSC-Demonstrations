require 'rubygems'
require 'davidrichards-etl'
require 'open-uri'
require 'data_frame'

class IncomeEtl < ETL
  def extract
    get_training_data
    get_test_data
  end
  
  def transform
    @raw = []
    @labels = %w(age workclass fnlwgt education education-num marital-status occupation relationship race sex capital-gain capital-loss hours-per-week native-country over-50)
    
    data = DataFrame.new(@labels)
    data.import('adult.data')
    data.items.delete_if {|i| i.size != @labels.size}

    test = DataFrame.new(@labels)
    test.import('adult.test')
    test.items.delete_if {|i| i.size != @labels.size}

    @raw << data
    @raw << test
    # May need to pre-process the data frame.  It's quite large, so you know.
    # About 3.8M for the training data and 1.9M for the test data. 
  end
  
  protected
    def get_training_data
      return true if File.exist?('adult.data')
      `wget http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data`
      
    end
    
    def get_test_data
      return true if File.exist?('adult.test')
      `wget http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.test`
    end
end
