require_relative 'menu_railway'

menu = Menu.new
menu.show_menu


loop do                      #цикл непрерывного пользовательского ввода пунктов меню
  puts "Введите число пункта меню:"
  menu_item = gets.chomp.to_i
  case(menu_item)
    when 4
      abort
    when 1
      menu.create_new_station
    when 11
      menu.show_all_stations
    when 2
      menu.create_passenger_train!
    when 21
      menu.create_cargo_train!
    when 22
      menu.create_passenger_wagon!
    when 23
      menu.create_cargo_wagon!
    when 24
      menu.attach_wagons_to_train
    when 25
      menu.detach_wagons_from_train
    when 26
      menu.move_train_forard!
    when 27
      menu.move_train_back!
    when 28
      menu.find_train!
    when 3
      menu.create_new_route
    when 31
      menu.add_middle_station
    when 32
      menu.remove_middle_station
    when 33
      menu.set_route_for_passenger_train
    when 34
      menu.set_route_for_cargo_train
    when 35
      menu.show_all_stations
    else
      puts "Неверный пункт меню"
  end
end
