puts "Cleaning database..."
Review.destroy_all
User.destroy_all

puts "Creating freelancers..."
taylor = User.create!(
  display_name: "Taylor Reeves",
  email: "taylor@example.com",
  password: "password",
  reviewable: true,
  bio: "Full-stack Rails developer with 5 years of experience building SaaS products."
)

jordan = User.create!(
  display_name: "Jordan Kim",
  email: "jordan@example.com",
  password: "password",
  reviewable: true,
  bio: "Freelance UI/UX designer specializing in clean, conversion-focused interfaces."
)

alex = User.create!(
  display_name: "Alex Morgan",
  email: "alex@example.com",
  password: "password",
  reviewable: true,
  bio: "Independent copywriter and content strategist for tech startups."
)

puts "Creating clients..."
client1 = User.create!(
  display_name: "Sarah Chen",
  email: "sarah@example.com",
  password: "password",
  reviewable: false
)

client2 = User.create!(
  display_name: "Marcus Webb",
  email: "marcus@example.com",
  password: "password",
  reviewable: false
)

client3 = User.create!(
  display_name: "Priya Patel",
  email: "priya@example.com",
  password: "password",
  reviewable: false
)

puts "Creating reviews..."
Review.create!(reviewer: client1, reviewee: taylor, stars: 5, body: "Taylor delivered exceptional work on our Rails API. Communicative, fast, and incredibly skilled.", created_at: 3.months.ago)
Review.create!(reviewer: client2, reviewee: taylor, stars: 5, body: "One of the best developers I've worked with. Clean code, great documentation, and delivered ahead of schedule.", created_at: 2.months.ago)
Review.create!(reviewer: client3, reviewee: taylor, stars: 4, body: "Very solid work. Would definitely hire again for our next project.", created_at: 1.month.ago)

Review.create!(reviewer: client1, reviewee: jordan, stars: 5, body: "Jordan completely transformed our product's UI. Our conversion rate went up 30% after the redesign.", created_at: 2.months.ago)
Review.create!(reviewer: client3, reviewee: jordan, stars: 5, body: "Incredible eye for design. Delivered stunning mockups within 48 hours.", created_at: 3.weeks.ago)

Review.create!(reviewer: client2, reviewee: alex, stars: 4, body: "Alex wrote compelling copy for our launch campaign. Understood our brand voice immediately.", created_at: 6.weeks.ago)
Review.create!(reviewer: client1, reviewee: alex, stars: 5, body: "Outstanding content strategy work. Our blog traffic doubled in two months.", created_at: 2.weeks.ago)

puts "Creating more clients..."
client4 = User.create!(
  display_name: "James Liu",
  email: "james@example.com",
  password: "password",
  reviewable: false
)

client5 = User.create!(
  display_name: "Olivia Torres",
  email: "olivia@example.com",
  password: "password",
  reviewable: false
)

client6 = User.create!(
  display_name: "Derek Nash",
  email: "derek@example.com",
  password: "password",
  reviewable: false
)

# Older and negative reviews using new clients
Review.create!(reviewer: client4, reviewee: taylor, stars: 3, body: "Work was decent but communication was slow. Had to follow up multiple times.", created_at: 8.months.ago)
Review.create!(reviewer: client5, reviewee: taylor, stars: 2, body: "Missed the deadline by two weeks and the code needed significant cleanup.", created_at: 10.months.ago)
Review.create!(reviewer: client6, reviewee: taylor, stars: 4, body: "Solid work overall. Minor issues but delivered a quality product.", created_at: 9.months.ago)

Review.create!(reviewer: client4, reviewee: jordan, stars: 2, body: "Initial designs looked great but revisions took forever and files were disorganized.", created_at: 5.months.ago)
Review.create!(reviewer: client5, reviewee: jordan, stars: 1, body: "Ghosted me halfway through the project. Had to find another designer to finish.", created_at: 7.months.ago)
Review.create!(reviewer: client6, reviewee: jordan, stars: 4, body: "Really creative work. Minor communication issues but the end result was worth it.", created_at: 4.months.ago)

Review.create!(reviewer: client4, reviewee: alex, stars: 3, body: "Copy felt generic — didn't really capture our brand voice despite multiple briefs.", created_at: 4.months.ago)
Review.create!(reviewer: client5, reviewee: alex, stars: 2, body: "Delivered late and the content needed significant editing before we could use it.", created_at: 5.months.ago)
Review.create!(reviewer: client6, reviewee: alex, stars: 5, body: "Nailed our product launch email sequence. Open rates doubled. Highly recommend.", created_at: 3.months.ago)



puts "Done! Created #{User.count} users and #{Review.count} reviews."
