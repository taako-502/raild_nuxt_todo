namespace :greet do
  desc "あいさつ"
  task say_hello: :environment do
    puts "Hello, World!"
  end

  desc "あいさつ（日本）"
  task say_hello2: :environment do
    puts "こんにちは、世界！"
  end
end
