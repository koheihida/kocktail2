class Decoration < ActiveHash::Base
  self.data = [
   { id: 1, name: ' ' },
   { id: 2, name: '大きい' },
   { id: 3, name: '華麗な' },
   { id: 4, name: 'とてつもない' },
   { id: 5, name: '使いにくい' },
   { id: 6, name: '残念な' },
   { id: 7, name: '偉そうな' },
   { id: 8, name: 'つまらなそうな' },
   { id: 9, name: 'くすぐったい' },
   { id: 10, name: '冷たい' }
  ]

  include ActiveHash::Associations
  has_many :posts
end