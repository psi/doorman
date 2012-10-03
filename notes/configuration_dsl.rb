# {
#   "scraping" => {
#     "blacklist_timeout" => 7.days,
#
#     "high_page_param" => {
#       "blacklist_incident_count" => 50
#     },
#
#     "too_many_requests" => {
#       "blacklist_incident_count" => 5000,
#       "blacklist_incident_period" => 1.hour
#     },
#   }
# }

incident_type "scraping" do |scraping|
  scraping.blacklist_incident_count = 50

  incident_type "high_page_param" do |high_page_param|
    high_page_param.blacklist_timeout = 5.days
  end
end
