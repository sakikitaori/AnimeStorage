# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'admin@test.com',
    password: 'sahidksho',
)
users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password1', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password2', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password3', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Item.create!(
  [
    {title: '100均でオタ活収納！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: '手軽に手に入る100均収納です。リフィルが多種ありいろんなサイズ展開があります！', user_id: users[0].id },
    {title: '無印のアクリル収納', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), body: 'アクリル収納と言ったら無印！本来はアクセサリー収納だけど、いろいろ収納できよ。', user_id: users[1].id },
    {title: 'かわいく銀テ収納したいならこれ！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: 'みんな大好きサンリオから銀テ収納が出たよ。ライブの思い出をきれいにかざろう！', user_id: users[2].id }
  ]
)