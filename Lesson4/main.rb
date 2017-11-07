require_relative 'controller'
require_relative 'menu_railway'

menu = Menu.new
menu.show_menu

controller = Controller.new

def create_new_station(controller) #1
  puts "Введите название станций(списком через запятую или поодиночке):"
  name = gets.chomp.upcase
  controller.create_station(name)
  puts "#{controller.stations}"
end

def create_passenger_train!(controller) #2
  puts "Введите название пассажирского поезда"
  name = gets.chomp.upcase
  controller.create_passenger_train(name)
end

def create_cargo_train!(controller) #21
  puts "Введите название грузового поезда"
  name = gets.chomp.upcase
  controller.create_cargo_train(name)
end

def create_passenger_wagon!(controller) #22
  puts "Ведите тип создаваемого вагона"
  type_wagon = gets.chomp.upcase
  puts "Введите количество создаваемых вагонов"
  quantity = gets.chomp.to_i
  controller.create_passenger_wagon(type_wagon, quantity)
end

def create_cargo_wagon!(controller) #23
  puts "Ведите тип создаваемого вагона"
  type_wagon = gets.chomp.upcase
  puts "Введите количество создаваемых вагонов"
  quantity = gets.chomp.to_i
  controller.create_cargo_wagon(type_wagon, quantity)
end

def attach_wagons_to_train(controller) #24
  puts "Введите название поезда, к которому прицепить вагоны"
  name_train = gets.chomp.upcase
  puts "Введите тип вагона"
  type_wagon = gets.chomp.upcase
  controller.attach_wagon!(name_train, type_wagon)
end

def detach_wagons_from_train(controller) #25
  puts "Введите название поезда, от которого надо отцепить вагоны"
  name_train = gets.chomp.upcase
  puts "Введите тип вагона"
  type_wagon = gets.chomp.upcase
  controller.detach_wagon!(name_train, type_wagon)
end

def move_train_forard!(controller) #26
  puts "Введите название поезда из списка поездов"
  name = gets.chomp.upcase
  controller.move_train_forward(name)
end

def move_train_back!(controller) #27
  puts "Введите название поезда из списка поездов"
  name = gets.chomp.upcase
  controller.move_train_back(name)
end

def create_new_route(controller) #3
  puts "Введите название маршрута"
  name_route = gets.chomp.upcase
  puts "Введите начальную станцию из списка станций"
  first_station = gets.chomp.upcase
  puts "Введите конечную станцию из списка станций"
  last_station = gets.chomp.upcase
  controller.create_route(name_route, first_station, last_station)
  puts "#{controller.route}"
end

def add_middle_station(controller) #31
  puts "Для добавления введите промежуточную станцию из списка станций"
  middle_station = gets.chomp.upcase
  controller.add_station!(middle_station)
end

def remove_middle_station(controller) #32
  puts "Для удаления введите промежуточную станцию из списка станций"
  middle_station = gets.chomp.upcase
  controller.del_station!(middle_station)
end

def set_route_for_passenger_train(controller) #33
  puts "Введите название маршрута"
  name_route = gets.chomp.upcase
  controller.select_route_for_passenger_train(name_route)
end

def set_route_for_cargo_train(controller) #34
  puts "Введите название маршрута"
  name_route = gets.chomp.upcase
  controller.select_route_for_cargo_train(name_route)
end

def show_all_stations(controller) #35
  controller.all_stations
end


loop do                      #цикл непрерывного пользовательского ввода пунктов меню
  puts "Введите число пункта меню:"
  menu_item = gets.chomp.to_i
  case(menu_item)
    when 4
      abort
    when 1
      create_new_station(controller)
    when 2
      create_passenger_train!(controller)
    when 21
      create_cargo_train!(controller)
    when 22
      create_passenger_wagon!(controller)
    when 23
      create_cargo_wagon!(controller)
    when 24
      attach_wagons_to_train(controller)
    when 25
      detach_wagons_from_train(controller)
    when 26
      move_train_forard!(controller)
    when 27
      move_train_back!(controller)
    when 3
      create_new_route(controller)
    when 31
      add_middle_station(controller)
    when 32
      remove_middle_station(controller)
    when 33
      set_route_for_passenger_train(controller)
    when 34
      set_route_for_cargo_train(controller)
    when 35
      show_all_stations(controller)
    else
      puts "Неверный пункт меню"
  end
end
