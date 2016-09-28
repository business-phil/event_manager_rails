class User < ActiveRecord::Base
  state_abbrs = %w{AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}

  has_secure_password
  has_many :events, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :joined_events, through: :attendees, source: :event
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, :city, presence:true
  validates :email, presence:true, format:{ with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness:{ case_sensitive:false }
  validates :state, presence:true, inclusion:{ in:state_abbrs,
      message:"%{value} is not a valid state" }
end
