class Attendee < ActiveRecord::Base
  # after_initialize :init

  belongs_to :user
  belongs_to :event

  validates :user, :event, presence:true

  # def init
  #     self.host = false if self.host.nil?
  # end
end
