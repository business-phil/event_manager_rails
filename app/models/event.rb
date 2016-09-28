class Event < ActiveRecord::Base
  state_abbrs = %w{AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}

  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :attendee_users, through: :attendees, source: :user
  has_many :comments, dependent: :destroy

  validates :user, :name, :city, presence:true
  validates :date, presence:true
  validates :state, presence:true, inclusion:{ in:state_abbrs,
      message:"%{value} is not a valid state" }
end
