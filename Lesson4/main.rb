require_relative "controller"
#меню
puts "Станция                 Поезд                                     Маршрут                                 Выход"
puts "Создать станцию(1)      Создать пассажирский поезд(2)             Создать маршрут                 (3)     Выход(4)"
puts "                        Создать грузовой поезд    (21)            Добавить станцию в маршрут      (31)"
puts "                        Создать пассажирский вагон(22)            Удалить станцию из маршрута     (32)"
puts "                        Создать грузовой вагон    (23)            Назначить маршрут пассажирскому поезду (33)"
puts "                        Добавить вагоны к поезду  (24)            Назначить маршрут грузовому поезду     (34)"
puts "                        Отцепить вагоны от поезду (25)            Список станций и поездов               (35)"
puts "                        Переместить поезд вперед  (26)"
puts "                        Переместить поезд назад   (27)"

controller=Controller.new    #создание объекта класса Controller, для управления железной дорогой

loop do                      #цикл непрерывного пользовательского ввода пунктов меню
  puts "Введите число пункта меню:"
  menu_item = gets.chomp.to_i
  case(menu_item)
    when 4
      abort
    when 1
      puts "Введите название станций(списком через запятую или поодиночке):"
      name = gets.chomp.upcase
      controller.create_station(name)
      puts "#{controller.stations}"
    when 2
      puts "Введите название пассажирского поезда"
      name = gets.chomp.upcase
      controller.create_passenger_train(name)
    when 21
      puts "Введите название грузового поезда"
      name = gets.chomp.upcase
      controller.create_cargo_train(name)
    when 22
      puts "Ведите тип создаваемого вагона"
      type_wagon = gets.chomp.upcase
      puts "Введите количество создаваемых вагонов"
      quantity = gets.chomp.to_i
      controller.create_passenger_wagon(type_wagon, quantity)
    when 23
      puts "Ведите тип создаваемого вагона"
      type_wagon = gets.chomp.upcase
      puts "Введите количество создаваемых вагонов"
      quantity = gets.chomp.to_i
      controller.create_cargo_wagon(type_wagon, quantity)
    when 24
      puts "Введите название поезда, к которому прицепить вагоны"
      name_train = gets.chomp.upcase
      puts "Введите тип вагона"
      type_wagon = gets.chomp.upcase
      controller.attach_wagon!(name_train, type_wagon)
    when 25
      puts "Введите название поезда, от которого надо отцепить вагоны"
      name_train = gets.chomp.upcase
      puts "Введите тип вагона"
      type_wagon = gets.chomp.upcase
      controller.detach_wagon!(name_train, type_wagon)
    when 26
      puts "Введите название поезда из списка поездов"
      name = gets.chomp.upcase
      controller.move_train_forward(name)
    when 27
      puts "Введите название поезда из списка поездов"
      name = gets.chomp.upcase
      controller.move_train_back(name)
    when 3
      puts "Введите название маршрута"
      name_route = gets.chomp.upcase
      puts "Введите начальную станцию из списка станций"
      first_station = gets.chomp.upcase
      puts "Введите конечную станцию из списка станций"
      last_station = gets.chomp.upcase
      controller.create_route(name_route, first_station, last_station)
      puts "#{controller.route}"
    when 31
      puts "Для добавления введите промежуточную станцию из списка станций"
      middle_station = gets.chomp.upcase
      controller.add_station!(middle_station)
    when 32
      puts "Для удаления введите промежуточную станцию из списка станций"
      middle_station = gets.chomp.upcase
      controller.del_station!(middle_station)
    when 33
      puts "Введите название маршрута"
      name_route = gets.chomp.upcase
      controller.select_route_for_passenger_train(name_route)
    when 34
      puts "Введите название маршрута"
      name_route = gets.chomp.upcase
      controller.select_route_for_cargo_train(name_route)
    when 35
      controller.all_stations
    else
      puts "Неверный пункт меню"
  end
end

=begin



=end

