class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :decoration

  validates :text, presence: true
end
