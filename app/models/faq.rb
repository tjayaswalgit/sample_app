class Faq < ActiveRecord::Base
  attr_accessible :answer, :category_id, :question
  belongs_to :category
  #acts_as_list :scope => :category


  validates :question, presence: true
end
