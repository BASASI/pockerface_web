# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!([
  {
    device_id: "12345678901",
    nickname: "ちゃんと目あけてるよ！",
    # image_url: "http://xn--u9j5h1btf1e330rp0n10z0h8f.jp/wp1/wp-content/uploads/20110929_research_09.jpg"
  },
  { device_id: "12345678902",
    nickname: "ドヤシェフ",
    # image_url: "http://motosumi01.up.seesaa.net/image/E5B79DE8B68AE382B7E382A7E38395.jpg"
  }
])

User.all.each do |user|
  Card.create!([
    {
      user_id: user.id,
      image_url: 'http://garu-sol32.sakura.ne.jp/sblo_files/sara-shibanakata/image/sara-shibanakata-2014-03-31T19:39:03-1.jpeg'
    }
  ])
end

