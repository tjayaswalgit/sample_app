class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :faqs             #, :order => "position"
  validates :name, presence: true
end
