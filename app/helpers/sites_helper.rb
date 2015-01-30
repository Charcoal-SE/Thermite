module SitesHelper
  def self.updateSites
    require 'net/http'
    url = URI.parse('http://api.stackexchange.com/2.2/sites?pagesize=1000&filter=!SlEYpdqUKQEfaEQ*yA&key=1)IcOudTYWhSx5J1)9dmTQ((')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    sites = JSON.parse(res.body)["items"]

    if sites.count > 100 #all is well
      sites.each do |site|
        if Site.find_by_site_url(site["site_url"])  == nil
          s=Site.new
          s.site_url = site["site_url"]
          s.get_comments = false
          s.icon_url = site["icon_url"]
          s.site_api_key = site["api_site_parameter"]
          s.site_name = site["name"]
          s.save!
        end
      end
    end
  end
end
