class Filter < ActiveRecord::Base
  attr_accessible :created_by, :reason, :regex, :site

  def testBody(body)
    begin
      result = body =~ /#{self.regex}/

      #Regex parsing successful

      if self.is_failing
        self.is_failing = false
        self.save!
      end

    rescue #There was an error parsing the regex

      if not self.is_failing
        self.is_failing = true
        self.save!
      end
      
      return false
    end
  end
end
