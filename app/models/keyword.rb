class Keyword < ApplicationRecord

  has_many :titles

  validates :text, {uniqueness: true}

  def self.search(search)
    if search != ""
      Keyword.where('text LIKE(?)', "%#{search}%")
    else
      Keyword.all
    end
  end
end
