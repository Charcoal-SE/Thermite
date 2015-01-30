class Site < ActiveRecord::Base
  attr_accessible :get_comments, :site_api_key, :site_name, :site_url
end
