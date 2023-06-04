namespace :greet do
  desc "あいさつ"
  task say_hello: :environment do
    puts "Hello, World!"
  end

  desc "あいさつ（日本）"
  task say_hello2: :environment do
    puts "こんにちは、世界！"
  end

  desc "あいさつ（中国）"
  task say_hello_chinese: :environment do
    greet_chinese
  end

  desc "あいさついろいろ"
  task say_hello_optional: :environment do
    greet('السلام عليكم')
  end
end

def greet_chinese
  puts "你好"
end

def greet(greeting = "Hello, World!")
  puts greeting
end