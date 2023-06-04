namespace :greet do
  desc "あいさつ"
  task say_hello: :environment do
    puts "Hello, World!"
  end
end
