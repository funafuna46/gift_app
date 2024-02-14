GiftCardTemplate.create!([
  { name: '肩たたき券', image_url: 'https://res.cloudinary.com/dk4bsjak1/image/upload/f_auto/v1707704247/%E8%82%A9%E3%81%9F%E3%81%9F%E3%81%8D%E5%88%B8_p8cqbr.png', has_message: true },
  { name: 'カフェ券', image_url: 'https://res.cloudinary.com/dk4bsjak1/image/upload/f_auto/v1707706100/cafe_h3bdsw.png', has_message: true },
  { name: 'star', image_url: 'https://res.cloudinary.com/dk4bsjak1/image/upload/f_auto/v1707708594/star_xjbuvg.png', has_message: false },
  { name: 'blue', image_url: 'https://res.cloudinary.com/dk4bsjak1/image/upload/f_auto/v1707709020/blue_x0nwho.png', has_message: false },
])

RecipientCategory.create!([
  { category_type: 'family' },
  { category_type: 'friend' },
  { category_type: 'colleague' },
  { category_type: 'other' }
])

GiftCategory.create!([
  { category_type: 'template' },
  { category_type: 'original' },
  { category_type: 'ai_generated' },
])
