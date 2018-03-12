categories = [
  'indian',
  'persian',
  'italian',
  'chinese'
]

categories.each do |category|
  Category.create!(name: category)
end