namespace :dev do
  desc 'Config development environment with fake articles'
  task setup: :environment do
    puts 'Recreating database'
    `rails db:drop db:create db:migrate`

    puts 'Creating a User'
    User.create!(
      username: Faker::Name.first_name,
      email: Faker::Internet.email,
      password_digest: '12345678'
    )
    puts 'User created!'

    puts 'Creating Articles'
    50.times do |_i|
      Article.create!(
        title: Faker::Lorem.paragraph(sentence_count: 1),
        description: Faker::Lorem.paragraphs(number: 2).join("\n"),
        user_id: User.all.first.id
      )
    end
    puts 'Articles created!'
  end
end
