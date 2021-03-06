day = 0                                   #объявление переменной для хранении даты(числа)
month = 0                                 #объявление переменной для хранении даты(месяца)
year = 0                                  #объявление переменной для хранении даты(года)

loop do                                   #цикл ввода пользовательских данных
  puts "Type a day:"                        #приглашение ввести дату (число)
  day = gets.chomp.to_i                     #сохраняется в переменную, приведенное к целочисленному виду            
  break if day > 0 && day < 32              #цикл прерывается, если пользователь ввел правильные данные
end

loop do                                   #цикл ввода пользовательских данных
  puts "Type month (as number 1,2,3...etc):"#приглашение ввести дату (месяц в виде числа)
  month = gets.chomp.to_i                   #ввод с приведением данных к целочисленному виду
  break if month >= 1 && month <= 12        #цикл прерывается, если пользователь ввел правильные данные
end

loop do                                   #цикл ввода пользовательских данных
  puts "Type year (as YYYY):"               #приглашение ввести дату в четырехзначном виде
  year = gets.chomp.to_i                    #ввод с приведением к целочисленному виду
  break if year > 0                         #цикл прерывается, если пользователь ввел правильные данные
end

def days(m)                               #функция вычисления количества дней в месяце по его порядковому номеру
  31 - (102/m&1) - (4/m&2)                #
end

leap_year = ((year % 4 == 0) && (year % 100 !=0) || year % 400 == 0)  #вычисление признака високосного года

month -= 1                                #переменной month присваеваем значение, соответствующее количеству предыдущих месяцев

(1..month).each do |x|                    #перебираем предыдущие месяы
  day += days(x)                          #и суммируем количество дней в них, прибавляя количество дней, соответствующее введенному 
                                          #пользователем числу
end 

if leap_year && day > 59                  #если год високосный и при этом количество дней с начала года больше 59
  puts "It's #{day + 1}th day of year"    #то к числу дней прибавляем единицу и выводим порядковый номер числа в году
else
  puts "It's #{day}th day of year"        #в противном случае если количество дней в високосном году меньше 59
end                                       #или год не високосный печатает порядковый номер числа в году


