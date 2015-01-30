module CommentsHelper
  def self.get_comments_for_all_active_sites
    Site.find_all_by_get_comments(true).each do |site|
      self.get_comments_for_site(site)
    end
  end
  def self.get_comments_for_site(site)
    require 'net/http'
    require 'date'

    url = URI.parse("http://api.stackexchange.com/2.2/comments?order=desc&pagesize=100&sort=creation&site=#{site.site_api_key}&filter=!1zSsisQasVU2D8U8fFA_s&key=1)IcOudTYWhSx5J1)9dmTQ((")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    comments = JSON.parse(res.body)["items"]

    comments.each do |comment|
      puts comment["comment_id"]
      if Comment.find_by_comment_id(comment["comment_id"]) == nil
        c=Comment.new
        c.site = site.id
        c.comment_id = comment["comment_id"]
        c.text = comment["body"]
        c.user_id = comment["owner"]["user_id"]
        c.owner_username = comment["owner"]["display_name"]
        c.creation_date = DateTime.strptime(comment["creation_date"].to_s, "%s")

        flag_reason = self.checkbody(c.text)

        if flag_reason != nil
          c.is_flagged = true
          c.flag_reason = flag_reason
        else
          c.is_flagged = false
        end

        c.save!
      end
    end
  end
  def self.checkbody(body)
    return "Testing" if body.include? " I "
  end
end
