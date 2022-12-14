# ユーザーの一部を対象にタスクを生成する（昨日)
# users = User.order(:id).take(20)
# 1.times do
#   name = 'レポート'
#   task_time = 20
#   rest_time = 1
#   set_number = Faker::Number.between(from: 1, to: 3).to_i
#   created_at = '2022-08-25 09:05:31'
#   users.each do |user|
#     user.tasks.create!(name: name, task_time: task_time, rest_time: rest_time, set_number: set_number,
#                        created_at: created_at)
#   end
# end

# ユーザーの一部を対象にタスクを生���する（昨日)
# users = User.order(:id).take(20)
# 1.times do
#   name = '英語'
#   task_time = 20
#   rest_time = 1
#   set_number = Faker::Number.between(from: 1, to: 3).to_i
#   created_at = '2022-08-25 09:05:31'
#   users.each do |user|
#     user.tasks.create!(name: name, task_time: task_time, rest_time: rest_time, set_number: set_number,
#                        created_at: created_at)
#   end
# end

# ユーザーの一部を対象にタスクを生成する（昨日)
# users = User.order(:id).take(20)
# 1.times do
#   name = '英語'
#   task_time = 20
#   rest_time = 1
#   set_number = Faker::Number.between(from: 1, to: 3).to_i
#   created_at = '2022-08-25 09:05:31'
#   users.each do |user|
#     user.tasks.create!(name: name, task_time: task_time, rest_time: rest_time, set_number: set_number,
#                        created_at: created_at)
#   end
# end

# ユーザー
# User.create!(name: 'Example User',
#              email: 'example@sakigake.com',
#              password: 'foobar',
#              password_confirmation: 'foobar')

# 49.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n + 1}@sakigake.com"
#   password = 'password'
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password)
# end

# # 以下のリレーションシップを作成する
# users = User.all
# user  = users.first
# following = users[2..30]
# followers = users[3..20]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

# 過去にやったタスク8/1〜8/24
users = User.order(:id).take(30)
15.times do
  name = 'プログラミング'
  rest_time = 1
  users.each do |user|
    user.tasks.create!(name: name, task_time: rand(10..15), rest_time: rest_time, set_number: rand(1..4),
                       created_at: Faker::Date.between(from: '2022-09-01', to: '2022-10-24'))
  end
end

users = User.order(:id).take(30)
15.times do
  name = '英語'
  rest_time = 1
  users.each do |user|
    user.tasks.create!(name: name, task_time: rand(10..15), rest_time: rest_time, set_number: rand(1..4),
                       created_at: Faker::Date.between(from: '2022-09-01', to: '2022-10-24'))
  end
end

users = User.order(:id).take(30)
15.times do
  name = 'レポート'
  rest_time = 1
  users.each do |user|
    user.tasks.create!(name: name, task_time: rand(10..15), rest_time: rest_time, set_number: rand(1..4),
                       created_at: Faker::Date.between(from: '2022-09-01', to: '2022-10-24'))
  end
end

# 今日やったタスク
users = User.order(:id).take(30)
1.times do
  name = 'レポート'
  rest_time = 1
  users.each do |user|
    user.tasks.create!(name: name, task_time: rand(10..15), rest_time: rest_time, set_number: rand(1..4))
  end
end

users = User.order(:id).take(30)
1.times do
  name = '英語'
  rest_time = 1
  users.each do |user|
    user.tasks.create!(name: name, task_time: rand(10..15), rest_time: rest_time, set_number: rand(1..4))
  end
end

users = User.order(:id).take(30)
1.times do
  name = 'プログラミング'
  rest_time = 1
  users.each do |user|
    user.tasks.create!(name: name, task_time: rand(10..15), rest_time: rest_time, set_number: rand(1..4))
  end
end

# ゲストユーザーのタスク作成
user = User.find_by(email: 'guest@example.com')
task_time = rand(10..15)
rest_time = 1
set_number = rand(1..4)

1.times do
  name = 'レポート'
  user.tasks.create!(name: name, task_time: task_time, rest_time: rest_time, set_number: set_number)
end

1.times do
  name = 'プログラミング'
  user.tasks.create!(name: name, task_time: task_time, rest_time: rest_time, set_number: set_number)
end

1.times do
  name = 'レポート'
  user.tasks.create!(name: name, task_time: task_time, rest_time: rest_time, set_number: set_number)
end
