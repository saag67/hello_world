require_relative 'controller'
class Menu

  def initialize
    @menu_items = []
    @controller = Controller.new
  end

  def show_menu
    <<~HEREDOC
      Станция                 Поезд                                     Маршрут                                 Выход
      Создать станцию(1)      Создать пассажирский поезд(2)             Создать маршрут                 (3)     Выход(4)
                              Создать грузовой поезд    (21)            Добавить станцию в маршрут      (31)
                              Создать пассажирский вагон(22)            Удалить станцию из маршрута     (32)
                              Создать грузовой вагон    (23)            Назначить маршрут пассажирскому поезду (33)
                              Добавить вагоны к поезду  (24)            Назначить маршрут грузовому поезду     (34)
                              Отцепить вагоны от поезду (25)            Список станций и поездов               (35)
                              Переместить поезд вперед  (26)
                              Переместить поезд назад   (27)
    HEREDOC

  end

  def create_new_station #1
    puts "Введите название станций(списком через запятую или поодиночке):"
    name = gets.chomp.upcase
    @controller.create_station(name)
    puts "#{@controller.stations}"
  end

  def create_passenger_train! #2
    puts "Введите название пассажирского поезда"
    name = gets.chomp.upcase
    @controller.create_passenger_train(name)
  end

  def create_cargo_train! #21
    puts "Введите название грузового поезда"
    name = gets.chomp.upcase
    @controller.create_cargo_train(name)
  end

  def create_passenger_wagon! #22
    puts "Ведите тип создаваемого вагона"
    type_wagon = gets.chomp.upcase
    puts "Введите количество создаваемых вагонов"
    quantity = gets.chomp.to_i
    @controller.create_passenger_wagon(type_wagon, quantity)
  end

  def create_cargo_wagon! #23
    puts "Ведите тип создаваемого вагона"
    type_wagon = gets.chomp.upcase
    puts "Введите количество создаваемых вагонов"
    quantity = gets.chomp.to_i
    @controller.create_cargo_wagon(type_wagon, quantity)
  end

  def attach_wagons_to_train #24
    puts "Введите название поезда, к которому прицепить вагоны"
    name_train = gets.chomp.upcase
    puts "Введите тип вагона"
    type_wagon = gets.chomp.upcase
    @controller.attach_wagon!(name_train, type_wagon)
  end

  def detach_wagons_from_train #25
    puts "Введите название поезда, от которого надо отцепить вагоны"
    name_train = gets.chomp.upcase
    puts "Введите тип вагона"
    type_wagon = gets.chomp.upcase
    @controller.detach_wagon!(name_train, type_wagon)
  end

  def move_train_forard! #26
    puts "Введите название поезда из списка поездов"
    name = gets.chomp.upcase
    @controller.move_train_forward(name)
  end

  def move_train_back! #27
    puts "Введите название поезда из списка поездов"
    name = gets.chomp.upcase
    @controller.move_train_back(name)
  end

  def create_new_route #3
    puts "Введите название маршрута"
    name_route = gets.chomp.upcase
    puts "Введите начальную станцию из списка станций"
    first_station = gets.chomp.upcase
    puts "Введите конечную станцию из списка станций"
    last_station = gets.chomp.upcase
    @controller.create_route(name_route, first_station, last_station)
    puts "#{controller.route}"
  end

  def add_middle_station #31
    puts "Для добавления введите промежуточную станцию из списка станций"
    middle_station = gets.chomp.upcase
    @controller.add_station!(middle_station)
  end

  def remove_middle_station #32
    puts "Для удаления введите промежуточную станцию из списка станций"
    middle_station = gets.chomp.upcase
    @controller.del_station!(middle_station)
  end

  def set_route_for_passenger_train #33
    puts "Введите название маршрута"
    name_route = gets.chomp.upcase
    @controller.select_route_for_passenger_train(name_route)
  end

  def set_route_for_cargo_train #34
    puts "Введите название маршрута"
    name_route = gets.chomp.upcase
    @controller.select_route_for_cargo_train(name_route)
  end

  def show_all_stations #35
    @controller.all_stations
  end
end