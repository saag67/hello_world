class Station                 #класс для создания станий
  
    attr_accessor :station    #методы доступа к переменным жкземпляра
    def initialize(station)   #конструктор класса
      @station = station        #инииализация переменных экземпляра
      @trains = []              #массив для хранения поездов
      @types=Hash.new(0)      #Да, этот хэш мне нужно было создать именно так, чтобы потом не городить проверку на nil
    end                       #хэш для хранения типов и количества поездов

    def display_trains          #метод-обертка отображающий поезда
      puts @trains
    end

    def display_trains_by_type  #Метод-обертка отображающий список поездов по типам и количеству
      puts @types         
    end

    def train_arrival(train)    #метод принимающий поезд на станцию
      type=train.get_type       #при въезде на станию поезд сообщает свой тип при помощи метода класса Train
      @types[type]+= 1           #стания учитывает тип и количество прибывших поездов
      train.speed_down          #поезд сбрасывает скорость
      @trains << train          #поезд прибыл на станцию
      
    end

    def train_depature(train)   #метод, отправляющий поезд со стании
      train.speed_up            #поезд набирает скорость
      type=train.get_type       #поезд, сообщает станции, при помощи метода класса Train какой тип поезда покидает станию
      @types[type]-= 1           #станция учитывает тип отбывшего поезда
      @trains.delete_if {|item| item === train} #поезд покинул станцию
      
    end

    def get_current_station     #метод-обертка получения текущей станции 
      @station
    end

end


class Train                   #класс Train для создания поездов
  
  attr_accessor :name, :type, :quantity_wagons, :current_speed, :count  #методы доступа к переменным экземпляра
  def initialize(name,type,quantity_wagons,current_speed=0)             #конструктор класса
    @name = name                          #наименование поезда
    @type = type                          #тип поезда
    @quantity_wagons = quantity_wagons    #количество вагонов в поезде
    @current_speed = current_speed        #текущая скорость поезда
    @count = 1                            #эта переменная экземпляра понадобится в качестве индекса для определения ближайших станций    
  end

  def speed_up          #метод-обертка для возврата увеличенной скорости
    @current_speed = 45 #
  end

  def current_speed     #метод-обертка для возврата текущей скорости
    @current_speed      #
  end

  def speed_down        #метод обертка для возврата нулевой скорости, поезд остановился
    @current_speed = 0  #
  end

  def attach_wagon      #метод для прицепления вагонов к поезду
    @quantity_wagons+=1 if @current_speed == 0  #число вагонов увеличивается на 1, если скорость равно 0
  end

  def detach_wagon      #метод для отцепления вагонов от поезда
    @quantity_wagons-=1 if @current_speed == 0  #число вагонов уменьшается на 1, если скорость равно 0
  end

  def get_type          #метод-обертка для получения типа поезда
    @type
  end

  def start_train(route)          #метод, который при получения маршрута, устанавливает поезд на первую станцию в маршруте
    start=route.get_stations.first #получаем объект класса Route, вызывем у него метод класса Station(объект Route содержит объекты Station), возвращающий стании(массив), и у него вызываем метод возвращающий первую станцию в списке
    start.train_arrival(self)     #посылаем сообщение методу train_arrival класса Station сообщение принять текущий поезд
  end

  def forward(route)              #Метод движения поезда вперед по маршруту
    
    n=route.get_stations.length   #получаем число станци в марщруте
    
    next_station=route.get_stations[@count]     #получаем слудующую станию в маршруте

    if @count <= n-1              #если это не конечная станция
      next_station.train_arrival(self)          #посылаем сообщение следующей станции принять текущий поезд
      next_station=route.get_stations[@count-1] #получаем станцию, которую надо покинуть
      next_station.train_depature(self)         #посылаем станции сообщение отправить текущий поезд
      @count += 1                               #переходим к следующей стании
    else
      puts "Поезд прибыл на конечную станцию"   #если поезд доехал до конечной станции, сообщаем об этом    
    end
      
  end

  def backward(route)               #метод движения поезда назад
   
    prev_station=route.get_stations[@count-2] #получить предыдущую станцию
    if @count!=0                              #если это не начальная станция
      prev_station.train_arrival(self)        #посылаем сообщение следующей станции принять текущий поезд
      prev_station=route.get_stations[@count-1] #получаем следующую станцию по ходу движения
      prev_station.train_depature(self)       #посылаем предыдущей станции сообщение отправить текущий поезд
      @count -= 1                             #переходим к следующей стании
    else
      puts "Поезд вернулся на начальную станцию"  #если поезд прибыл на начальную станию, сообщаем об этом
    end

  end

  def get_hearest_stations(route)   #метод получения ближайших станций, предыдущая, текущая, следующая
    n=route.get_stations.length     #получаем число станций из маршруты
    puts route.get_stations[@count-1].get_current_station if @count-1 >= 0    #отображаем предыдущую станцию, если это не начальная станция
    puts route.get_stations[@count].get_current_station                       #отображаем текущую станцию
    puts route.get_stations[@count+1].get_current_station if @count+1 <= n-1  #отображаем следующую станцию, если это не конечная       
  end
    
end

class Route                           #класс Route для создания маршрутов

  def initialize(source, destination) #конструтор класса
    @stations=[source,destination]    # сам маршрут с начальной и конечной станцией
  end

  def add_station(before_station, new_station)    #метод добавления промежуточной станции в маршрут, первый параметр станция перед которой добавляем новую, второй новая станция
    index_station=@stations.index(before_station) #получения места в маршруте, куда мы хотим добавтьь станцию, должны указать станцию в маршруте, перед которой добавляем новую
    @stations.insert(index_station,new_station)   #вставляем на указанное место станцию
  end

  def del_station(station)                        #удаление стании из маршрута, параметр - удаляемая станция
    @stations.delete_if {|item| item === station && item !=@stations.first && item !=@stations.last}
  end                                             #удаляем станцию, если она не начальная и не конечная

  def display_route                               #метод отображающий все станции на маршруте
    puts "#{@stations}"                           #со всей инфрмацией по поездам - их типам, количеству и местонахождению
  end

  def get_stations                                #метод обертка возвращающий все станции
    @stations
  end

  
end

#Здесь ниже закомментированный код, который я испльзовал для тестирования классов, можно раскомментировать и посмотреть как это раотает
=begin
train=Train.new("626","cargo",36)
actobe=Train.new("925","carriage",14)
station=Station.new("Atyrau")
station.train_arrival(train)
station.train_arrival(actobe)

station.train_depature(actobe)
station.display_trains_by_type

atyrau=Station.new("Atyrau")
actobe=Station.new("Actobe")

makat=Station.new("Makat")
dossor=Station.new("Dossor")
route=Route.new(atyrau,actobe)
#route.display_route
route.add_station(actobe,makat)

route.add_station(actobe,dossor)

route.del_station(atyrau)

train=Train.new("626","cargo",36)
train.start_train(route)
#route.display_route
train.forward(route)
train.forward(route)
train.forward(route)
train.backward(route)
train.backward(route)
train.backward(route)
train.backward(route)
train.get_hearest_stations(route)
#route.display_route
=end