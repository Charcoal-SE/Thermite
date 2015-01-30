class Filter < ActiveRecord::Base
  attr_accessible :created_by, :reason, :regex, :site

  def testBody(body)
    return body =~ /#{self.regex}/
  end
end
