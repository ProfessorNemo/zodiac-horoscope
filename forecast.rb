# Программа "Зодиакальный гороскоп" (на сегодня, на завтра, на неделю, на месяц, на год)
require 'json'
require 'nokogiri'
require 'open-uri'

PW = 'lib/'.freeze
%W[#{PW}facts #{PW}introduction #{PW}prediction].each do |file|
  require_relative file
end

BASE_URL = 'https://orakul.com/'.freeze

# Прочитаем файл со знаками зодиака и запишем данные в ассоциативный хэш-массив
file = File.read("#{__dir__}/data/signs.json", encoding: 'utf-8')
signs = JSON.parse(file)

# Запрос у пользователя даты его рождения
puts 'Когда вы родились (укажите дату в формате ДД.ММ, например, 31.12)'
user_date_string = $stdin.gets.chomp

# Определение знака зодиака по дате рождения
definition = Facts.sign_identification(signs, user_date_string)

# Номер знака зодиака
user_zodiac = definition['number'].to_i

puts "\nВыберите разновидность гороскопа? Введите число от 1 до #{Facts::TYPES.size}:\n\n"
Facts.give_types
user_type = $stdin.gets.to_i
puts
until user_type.between?(1, Facts::TYPES.size)
  print "Введите номер знака зодиака от 1 до #{Facts::TYPES.size}: "
  user_type = $stdin.gets.to_i
  puts
end

puts "Выберите период прогнозирования? Введите число от 1 до #{Facts::PERIOD.size}:\n\n"
Facts.give_period
user_period = $stdin.gets.to_i
puts
until user_period.between?(1, Facts::PERIOD.size)
  print "Введите номер знака зодиака от 1 до #{Facts::PERIOD.size}: "
  user_period = $stdin.gets.to_i
  puts
end

# очистить экран
puts "\e[H\e[2J"

vars =
  { number: definition['number'],
    name_ru: definition['sign_ru'],
    name_en: signs.keys[user_zodiac - 1],
    type: Facts::TYPES[Facts::TYPES.keys.each(&:to_sym)[user_type - 1]],
    time: Facts::PERIOD[Facts::PERIOD.keys.each(&:to_sym)[user_period - 1]] }

begin
  intro = Introduction.init(vars)
  prediction = Prediction.new(vars).fetch_forecast!
rescue SocketError => e
  puts "Ошибка соединения с сервером: #{e.message}"
  abort e.message
end

puts <<~HOROSCOPE
  #{intro[:name]}:\n#{intro[:date]},\n#{intro[:head]}\n
  #{definition['text']}\n
  #{prediction[:head]}:\n\n#{prediction[:forecast]}
HOROSCOPE
