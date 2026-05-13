desc "Reset the database and seed it with believable demo data"
task({ sample_data: :environment }) do
  starting = Time.now

  if Rails.env.production?
    puts "Refusing to run sample_data in production!"
    exit
  end

  puts "Wiping existing data..."
  Review.destroy_all
  Link.destroy_all
  User.destroy_all

  puts "Creating demo admin account..."
  User.create!(
    email: "demo@repboard.com",
    password: "password123",
    display_name: "Demo Admin",
    bio: "Personal demo account — use email demo@repboard.com / password123 to log in.",
    reviewable: false
  )

  puts "Creating freelancers..."
  freelancers = []
  15.times do |i|
    name = Faker::Name.unique.name
    freelancers << User.create!(
      email: Faker::Internet.unique.email(name: name),
      password: "password123",
      display_name: name,
      bio: "#{Faker::Company.catch_phrase}. #{Faker::Lorem.sentence(word_count: 12)}",
      reviewable: true,
      avatar_url: "https://i.pravatar.cc/300?img=#{i + 1}"
    )
  end

  puts "Creating portfolio links..."
  link_labels = ["Portfolio", "LinkedIn", "GitHub", "Twitter", "Personal Site", "Blog"]
  freelancers.each do |user|
    rand(2..4).times do |idx|
      Link.create!(
        user: user,
        label: link_labels.sample,
        url: "https://#{Faker::Internet.domain_name}",
        position: idx
      )
    end
  end

  puts "Creating reviews..."
  review_pairs = freelancers.permutation(2).to_a.shuffle.first(50)
  review_pairs.each do |reviewer, reviewee|
    Review.create!(
      reviewer: reviewer,
      reviewee: reviewee,
      stars: rand(1..5),
      body: Faker::Lorem.paragraph(sentence_count: rand(2..6))
    )
  end

  ending = Time.now

  puts
  puts "Sample data created in #{(ending - starting).round(1)} seconds:"
  puts "  - #{User.count} users (1 demo admin + 15 freelancers)"
  puts "  - #{Link.count} portfolio links"
  puts "  - #{Review.count} reviews"
  puts
  puts "Log in with demo@repboard.com / password123"
end
