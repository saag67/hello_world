price={}                  #хэш для хранения товаров и их стоимости

loop do                   #цикл пользовательского ввода
  goods=nil               #переменная для хранения наименования товаров
  vars={}                 #вложенный хэш для хранения данных по товарам
  loop do                 #  вложенный цикл пользовательского ввода по наименованию товара
    puts "Введите наименование товара:"   #приглашение ввода наименования товара
    goods=gets.chomp                      #получение наименования товара
    break if goods !=""                   #цикл будет повторяться если будет введена пустая строка
  end

break if goods == "stop" || goods == "стоп"         #цикл пользовательского ввода верхнего уровня прервется
                                                    #если пользователь введет "стоп" или "stop"
  loop do                                           #вложенный цикл пользовательского ввода для цены товара
    puts "Введите цену за единицу товара:"          #приглашение ввода
    vars[:cost] = gets.chomp.to_f                   #получения данных от пользователя и сохранения их во вложенном хеше
    break if vars[:cost] > 0                        #цикл будет повторяться если цена будет меньше или равна нулю
  end

  loop do                                           #вложенный цикл пользовательского ввода для количества товаров
    puts "Введите количество товара:"               #приглашение ввода
    vars[:quantity] = gets.chomp.to_f               #получение данных от пользователя о количестве товаров
    break if vars[:quantity] > 0                    #цикл прервется если количество товаров больше нули
  end

  vars[:subtotal] = vars[:cost] * vars[:quantity]   #итог по отдельно взятому товару

  if price.has_key?(goods)                          #если товар с таким именем уже существует
    price[goods]=vars                               #присвоить ему новую цену и количество
  else
    price[goods] = vars                             #в противном случае создать товар и присвоить ему цену и количество
  end
  
end

total=0                                             #общий итог

price.each do |goods, costs|                        #перебор главного хэша 
  costs.each do |key, value|                        #берем вложенный хэш и перебираем его
    if key == :subtotal                             #если ключ это :subtotal
      total += value                                #то суммируем в переменную total его значение
    end
  end

  puts "#{goods}: #{costs}"                         #печатаем главный хэш
end

puts "Total: #{total}"                              #выводим общий итог
