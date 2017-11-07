require_relative "train"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "station"
require_relative "route"
require_relative "cargo_wagon"
require_relative "passenger_wagon"


class Controller                      #класс Controller для управления железной дорогой

  attr_reader :stations, :trains, :routes, :station, :route, :wagon, :train # методы доступа к переменным экземпляра
  def initialize                    #конструктор класса
    @stations = []                  #массив для хранения списка станций
    @trains = []                    #массив для хранения списка поездов
    @routes = {}                    #хэш для хранения списка маршрутов
    @depot = []                     #массив для хранения списка вагонов
  end

  def create_station(name)          #метод create_station для создания станции, параметр - имя станции, или имена через запятую
    tmp = name.gsub(/\s/,'')        #в полученной строке заменяем пробелы на пустые строки
    station_name = tmp.split(',')   #получаем массив строк
    station_name.each do |station|  #перебираем полученный массив и для каждого элемента создаем объект класса Station
    @station = Station.new(station)
    @stations << @station           #заносим полученные объекты в массив @stations для хранения
    end
  end

  def create_route(name_route, source, destination)         #метод create_route для создания маршрута, параметры - имя маршрута, начальная и конечные станции
    first = @stations.find { |item| item.name == source}    #из массива @stations получаем начальную станцию по имени
    last = @stations.find { |item| item.name == destination}##из массива @stations получаем конечную станцию по имени
    @route = Route.new(first, last)                         #создаем маршрут с начальной и конечной станцией
    @routes[name_route] = @route                            #сохраняем созданный маршрут в хэш, ключ - название маршрута, значение сам маршрут
  end

  def add_station!(middle_station)                                #метод add_station! для добавления промежуточной станции в маршрут
    middle = @stations.find { |item| item.name == middle_station} #получаем станцию по имени из списка станий
    @route.add_station(middle) if middle                          #вызываем метод класса Route для добавления станции в маршрут
  end

  def del_station!(middle_station)                                #метод del_station! для удаления промежуточной станции из маршрута
    middle = @stations.find { |item| item.name == middle_station} #получаем станцию по имени из списка станий
    @route.del_station(middle) if middle                          ##вызываем метод класса Route для удаления станции из маршрута
  end

  def all_stations                                                #метод для отображения всех станций и поездов на них
    puts "#{@route.stations}"
  end

  def create_cargo_train(name)                                  #метод для создания грузового поезда
    @cargo_train = CargoTrain.new(name)                         #создаем грузовой поезд
    @trains << @cargo_train                                     #записываем созданный поезд в массив для хранения
  end

  def create_passenger_train(name)                              #метод для создания пассажирского поезда
    @passenger_train = PassengerTrain.new(name)                 #создаем пассажирский поезд
    @trains << @passenger_train                                 #записываем созданный поезд  в массив для хранения
  end

  def select_route_for_cargo_train(name_route)                  #метод назначения маршрута грузовому поезду, параметр - имя маршрута
    @routes.each do |key, value| key == name_route              #перебираем хэш если введенное имя маршрута и хранящеесы в хэше совпали
      @cargo_train.set_route(value) if key                        #назначаем поезду маршрут если такой маршрут существует
    end
  end

  def select_route_for_passenger_train(name_route)              #метод назначения маршрута пассажирскому поезду, параметр - имя маршрута
    @routes.each do |key, value| key == name_route              #перебираем хэш если введенное имя маршрута и хранящеесы в хэше совпали
      @passenger_train.set_route(value)  if key                   #назначаем поезду маршрут если такой маршрут существует
    end
  end

  def move_train_forward(name)                                            #метод передвижения поезда вперед, параметр - название поезда
    selected_train = @trains.find { |item| item.name == name}             #выбрать поезд из списка поездов
    if selected_train                                                     #если таковой поезд существует
      @cargo_train.forward if selected_train.class == CargoTrain          #отправить поезд если это грузовой поезд
      @passenger_train.forward if selected_train.class == PassengerTrain  #отправить поезд, если это пассажирский поезд
    else
      puts "Нет такого поезда"                                            #если такого поезда нет, сообщить об этом
    end
  end

  def move_train_back(name)                                               #метод движения поезда назад
    selected_train = @trains.find { |item| item.name == name}             #выбрать поезд из списка поездов
    if selected_train                                                     #если таковой поезд существует
      @cargo_train.forward if selected_train.class == CargoTrain          #отправить поезд если это грузовой поезд
      @passenger_train.backward if selected_train.class == PassengerTrain #отправить поезд, если это пассажирский поезд
    else
      puts "Нет такого поезда"                                            #если такого поезда нет, сообщить об этом
    end
  end

  def create_passenger_wagon(type_wagon, quantity)                        #метод создания пассажирского вагона,параметры - тип, количество
    if quantity > 0
      quantity.times do
        wagon = PassengerWagon.new(type_wagon)                                #создаем пассажирский вагон с указанным типом и количеством (купе, плакарт, СВ, общий)
        @depot << wagon                                                       #записываем созданный вагон в массив для хранения
      end
    end
  end

  def create_cargo_wagon(type_wagon, quantity)                              #метод создания грузового вагона
    if quantity > 0
      quantity.times do
        wagon = CargoWagon.new(type_wagon)                                    #создаем грузовой вагон указанного типа и количества (платформа, товарный, насыпной, наливной)
        @depot << wagon                                                       #записываем созданный вагон в массив для хранения
      end
    end
  end

  def attach_wagon!(name_train, type_wagon)                               #метод прицепления вагона к поезду
    train = @trains.find { |item| item.name == name_train}                #получаем поезд по имени из списка поездов
    wagon = @depot.find { |item| item.type == type_wagon}                 #получаем вагон по типу из списка вагонов
    if train && wagon                                                     #если такие поезд и вагон существуют
      @cargo_train.attach_wagon(wagon) if train.class == CargoTrain && wagon.class == CargoWagon  #прицепить вагон, если это грузовой вагон к грузовому поезду
      @passenger_train.attach_wagon(wagon) if train.class == PassengerTrain && wagon.class == PassengerWagon  #приепить вагон, если это пассажирский вагон к пассажирскому поезду
    else
      puts "Неверный ввод"                                                #если ошибка ввода сообщить об этом
    end
  end

  def detach_wagon!(name_train,type_wagon)                                #метод отцепления вагона
    train = @trains.find { |item| item.name == name_train}                #получаем поезд по имени из списка поездов
    wagon = @depot.find { |item| item.type == type_wagon}                 #получаем вагон по типу из списка вагонов
    if train && wagon                                                     #если такие поезд и вагон существуют
      @cargo_train.detach_wagon(wagon) if train.class == CargoTrain && wagon.class == CargoWagon  #отцепить вагон, если это грузовой вагон от грузового поезда
      @passenger_train.detach_wagon(wagon) if train.class == PassengerTrain && wagon.class == PassengerWagon  #отцепить вагон, если это пассажирский вагон от пассажирского поезда
    else
      puts "Неверный ввод"                                                #
    end
  end
end