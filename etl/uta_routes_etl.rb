require 'rubygems'
require 'davidrichards-etl'

class UTARoutesETL < ETL
  
  # From here: http://www.rideuta.com/ridinguta/schedules/routeschedules.aspx
  # Get the 8 route categories: 
  # javascript:__doPostBack('ctl01$ctl01$ctl02$rootBodyRegion$ridingUTARegion$schedulesRegion$routeGroupList$ctl00$routeGroupLink','')
  # Will need to take a look at doPostBack to see if I can use normal
  # scraping
  # tools 
  
  # On each route category, will need to grab the routes page:
  # http://www.rideuta.com/ridinguta/viewSchedule.aspx?abbreviation=701&dir=0&service=4&signup=87&pdaView=False
  # There will be some classification from the context: route rumber,
  # route name, route days, route
  # direction 

  # On each route page, will need to grab the stops and the times.  Be
  # careful, sometimes I get an about:blank instead of a link.  May need
  # to refresh the route category page from time to time. 
end