module CommentsHelper
  def self.get_comments_for_all_active_sites
    Site.find_all_by_get_comments(true).each do |site|
      self.get_comments_for_site(site)
      site.last_comment_fetch = DateTime.now
      site.save!
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

    existing_comments = Comment.select(:comment_id).limit(100).order("comment_id DESC").where(site: site.id).map { |c| c.comment_id }

    filters = Filter.find_all_by_site(site.id)

    comments = JSON.parse(res.body)["items"]

    ActiveRecord::Base.transaction do
      comments.each do |comment|
	puts comment["comment_id"]
	if not existing_comments.include? comment["comment_id"]
	  c=Comment.new
	  c.site = site.id
	  c.comment_id = comment["comment_id"]
	  c.text = comment["body"]
	  c.user_id = comment["owner"]["user_id"]
	  c.owner_username = comment["owner"]["display_name"]
	  c.creation_date = DateTime.strptime(comment["creation_date"].to_s, "%s")

	  flag_reason = self.checkbody(c.text, site, filters)

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
  end
  def self.checkbody(body, site, filters)
    filters.each do |filter|
      return filter.reason if filter.testBody(body)
    end
    return nil
  end
end
