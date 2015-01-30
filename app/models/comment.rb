class Comment < ActiveRecord::Base
  attr_accessible :comment_id, :creation_date, :site, :text, :user_id
end
