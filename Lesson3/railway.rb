class Station                           #класс Staion для создания станий
  
    attr_reader :name_station, :trains  #методы доступа к переменным экземпляра
    def initialize(name_station)        #конструктор класса
      @name_station=name_station        #инииализаия переменных экземпляра
      @trains = []                      #
    end       

    def get_trains_by_type(type_train)  #метод получения поездов по типу, параметр - тип поезда
      n = 0                             #счетчик поездов
      @trains.each {|train| n += 1 if train.type === type_train}  #если тип поезда на стании совпадает с введенным, увеличиваем счетчик на 1
      n                                 #в противном случае возвращаем текущее значение счетчика - 0
    end       

    def train_arrival(train)            #метод принятия поезда на станцию
      @trains << train                  #   поезд прибыл на станцию
    end

    def train_depature(train)           # метод отправки поезда со станции   
      @trains.delete_if {|item| item === train} #поезд отправляется, если он есть на станции
    end

    

end
#=============================Train=================================

class Train                             #Класс Train для создания поездов
  
  attr_accessor :name, :type, :quantity_wagons, :current_speed  #методы доступа к переменным экземпляра
  def initialize(name, type, quantity_wagons) #конструктор класса
    @name = name                              #инициализация переменных экземпляра
    @type = type                              #
    @quantity_wagons = quantity_wagons        #
    @current_speed = 0                        #
    @current_station_index = 0                #
    
  end

  def speed_up(speed)                         #метода набора поездом скорости, параметр введенное значение скорости
    @current_speed = speed                    #текущая скорость увеличена на введенное значение
  end

  def speed_down                              #метод сброса скорости до нуля
    @current_speed = 0                        #значение текущей скорости установлено в 0
  end

  def attach_wagon                            #метод прицепления вагонов
    @quantity_wagons+=1 if @current_speed == 0  #вагон прицепляется, если текущая скорость поезда равна 0
  end

  def detach_wagon                            #метод отцепления вагонов от поезда
    @quantity_wagons-=1 if @current_speed == 0 && @quantity_wagons > 0  #вагон отцепляется, если значение текущей скорости равно 0 и количество вагонов больше 0
  end

  
  def set_route(route)                        #метод получения поездом маршрута, параметр объект класса Route
    @route = route                            #параметр сохраняется в переменную экземпляра для дальнейшего использования в других методах
    start = @route.stations.first             #поезд устанавливается на первую станию в маршруте
    start.train_arrival(self)                 #стании посылается сообщение принять поезд
  end

  def forward                                 #метод движения поезда вперед
    
    n=@route.stations.length                  #из полученного маршрута получается число станций
    next_station=@route.stations[@current_station_index]  #определяется следующая станция на маршруте

    if @current_station_index <= n-1          #если текущая станция не конец маршрута
      next_station.train_arrival(self)        #следующей станции посылается сообщение принять поезд
      next_station=@route.stations[@current_station_index - 1]  #определяется станция, которой надо послать сообщение отправить поезд
      next_station.train_depature(self)       #станции посылается сообщение отправить поезд
      @current_station_index += 1             #увеличивается индекс текущей станции
    else
      puts "Поезд прибыл на конечную станцию" #если поезд прибыл на конечную станцию посылается сообщение об этом     
    end
      
  end

  def backward                                #метод движения поезда назад               
    prev_station=@route.stations[@current_station_index - 2]  #определяется следующая станция по маршруту возврата
    if @current_station_index != 0                            #если это не начальная станция маршрута
      prev_station.train_arrival(self)                        # станции посылается сообщение принять поезд
      prev_station=@route.stations[@current_station_index - 1]  #определяется станция, которой надо послать сообщение отправить поезд
      prev_station.train_depature(self)                       #станции посылается сообщение отправить поезд
      @current_station_index -= 1                             #индекс текущей станции уменьшается
    else
      puts "Поезд вернулся на начальную станцию"              #если поезд прибыл на начальную станцию, сообщаем об этом
    end

  end

  def get_preview_station                                     #метод получения предыдущей станции
    @route.stations[current_station_index-1] if @current_station_index-1 >= 0 #получаем из маршрута предыдущую станцию, если поезд находится не на начальной станции
  end

  def get_current_station                                     #метод получения текущей станции
    @route.stations[@current_station_index]                   #получаем текущую станцию из маршрута
  end

  def get_next_station                                        #метод получения следующей станции
    ln = @route.stations.length                               #получаем количество станций в маршруте
    @route.stations[@current_station_index+1] if @current_station_index+1 <= ln - 1 #получаем следующую станцию, если поезд не находится на конечной станции
  end
    
end
#================================Route=========================================
class Route                                                   #Класс Route для создания маршрута

  attr_reader :stations                                       #метод доступа к переменной экземпляра

  def initialize(source, destination)                         #конструктор класса
    @stations=[source, destination]                           # инициализация переменной экземпляра
  end

  def add_station(new_station)                                #метод добавления промежуточной станции
    @stations.insert(-2, new_station)                         #станция добавляется в маршрут
  end

  def del_station(station)                                    #Метод удаления промежуточной станции из маршрута
    @stations.delete_if {|item| item === station && item != @stations.first && item != @stations.last} #станция удаляется, если она не начальная и не конечная в маршруте
  end
  
end


