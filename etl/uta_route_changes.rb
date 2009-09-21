require 'rubygems'
require 'davidrichards-etl'

# This keeps track of the changes over time.  They all get posted here,
# hopefully, and therefore I can have a gradually changing dimension. 
class UTARouteChangesETL < ETL
  
  # Start here: 
  # http://www.rideuta.com/ridingUTA/routeChanges/default.aspx
  # Will need to take a more careful look at what kind of information is
  # there, and whether the links are time-sensitive. 
end