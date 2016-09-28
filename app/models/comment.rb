class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user, :event, :comment, presence:true
end
