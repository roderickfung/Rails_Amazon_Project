namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    @count = 1

    6.times do |x|
      @category = Category.create!(
      name: Faker::Commerce.department(2)
      )
    end

    1000.times do |x|
      @product = Product.create!(
      title: "#{Faker::Commerce.product_name}#{@count.to_s}",
      description: Faker::Lorem.paragraph(2),
      price: Faker::Commerce.price,
      category_id: rand(1..6),
      )
      @count += 1
    end

    5000.times do |x|
      @review = Review.create!(
      star_count: rand(1..5),
      body: Faker::Lorem.paragraph(3),
      product_id: rand(1..100)
      )
    end

  end
end
