puts "Введите коэффициент а:"
a = gets.chomp.to_f                                                          #получаем коэффициент а, обрезаем символ перевода строки и приводим данные к вещественному виду
puts "Введите коэффициент b:" 
b = gets.chomp.to_f                                                          #получаем коэффициент b, обрезаем символ перевода строки и приводим данные к вещественному виду
puts "Введите коэффициент c:"
c = gets.chomp.to_f                                                          #получаем коэффициент c, обрезаем символ перевода строки и приводим данные к вещественному виду

d = (b**2) - (4*a*c)                                                         #вычисляем дискриминант

if d > 0                                                                     #Если дискриминант больше нуля
  x1 = (-b + Math.sqrt(d)) / (2*a)                                           #вычисляем первый корень уравнения
  x2 = (-b - Math.sqrt(d)) / (2*a)                                           #вычисляем второй корень уравнения
  puts "Дискриминант D=#{d}, первый корень х1=#{x1}, второй корень х2=#{x2}" #выводим полученные значения
elsif d == 0                                                                 #если дискриминант равен 0 то корни равны между собой
  x1 = -( b / (2*a) )                                                        #вычисляем только один корень уравнения
  puts "Дискриминант D=#{d}, x1=x2=#{x1}"                                    #выводим значения на экран
else
  puts "Дискриминант D=#{d}, корней нет"                                     #если дискриминант меньше 0, то выводим значение дискриминанта и сообщение, что корней уравнения нет
end