# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Ash: Creating some sample data for the "portfolio-feature" branch
#Using Ruby create sets of data for each table: blogs, portfolios, skills


#Moving Topic seed to top even though it was added much later.
#This is because Blog topic_id foreign key generation are dependant on Topic's existence
3.times do |l|
  Topic.create!(
    title: "Topic #{l}"
  )
end

puts "3 topics created"


10.times do |i|
  Blog.create!(
    title: "Blog #{i}",
    #body fake data from:https://lipsum.com/
    body: "seeded data: Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
    topic_id: Topic.last.id  #Reference all blogs to the same topic (3rd topic created on this seed file)
  )
end

puts "10 blogs created"


5.times do |j|
    Skill.create!(
      title: "Skill #{j}",
      percent_utilized: 15
    )
end

puts "5 skills created"


8.times do |k|
  Portfolio.create!(
    title: "Portfolio #{k}",
    subtitle: "Ruby on Rails",
    body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    #image fake data from: https://place-hold.it/300
    image:"https://place-hold.it/600*400",
    thumb_image: "https://place-hold.it/350*200"
  )
end

1.times do |k|
  Portfolio.create!(
    title: "Portfolio #{k}",
    subtitle: "Angular",
    body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    #image fake data from: https://place-hold.it/300
    image:"https://place-hold.it/600*400",
    thumb_image: "https://place-hold.it/350*200"
  )
end


puts "9 portfolios created"


3.times do |m|
  #Technology.create!(
    #name: "Technology #{m}",
    #portfolio_id: Portfolio.last.id
  #)

  #Alternate syntax taking advantage of the parent(portfolio)-child(technologies) relastionship
  Portfolio.last.technologies.create!(
    name: "Technology #{m}"  #automatically associated the portfolio_id (foreign key) to the technology record
  )
end

puts "3 technologies created"
