class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :decoration
  has_many :titles

  validates :text, presence: true
end
