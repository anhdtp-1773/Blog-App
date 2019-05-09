User.create!(name: "anh_xinh",
             nick_name: "anh_xinh",
             email: "user@gmail.com",
             is_admin: true,
             is_female: true,
             password: "123456",
             confirmation_token: "8c80bbac5c4df6e9a85af6940ba1c3f3",
             confirmed_at: Time.zone.now,
             confirmation_sent_at: Time.zone.now)

9.times do |n|
  name  = "anh_xinh_#{n+1}"
  email = "user-#{n+1}@gmail.com"
  password = "123456"
  nick_name = "anh_xinh_#{n+1}"
  User.create!(name: name,
               email: email,
               nick_name: nick_name,
               is_admin: false,
               is_female: true,
               password: password,
               confirmation_token: "8c80bbac5c4df6e9a85af6940ba1c3f3",
               confirmed_at: Time.zone.now,
               confirmation_sent_at: Time.zone.now)
end

10.times do |n|
  temp = Entry.create!(user_id: n+1,
               title: FFaker::Lorem.sentence(5),
               body: FFaker::Lorem.sentence(60),
               status: 1)
  temp.image.attach(io: File.open(Rails.root.join("public", "a.jpg")), filename: 'image.png')
end

10.times do |n|
  10.times do |m|
    Comment.create!(entry_id: m+1,
              user_id: n+1,
              content: FFaker::Lorem.sentence(10)
    )
  end
end
