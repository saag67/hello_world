class Route                           #Класс Route для создания маршрута

  attr_reader :stations             #метод доступа к переменной экземпляра

  def initialize(source, destination)  #конструктор класса
    @stations=[source, destination]    # инициализация переменной экземпляра
  end

  def add_station(new_station)        #метод добавления промежуточной станции
    @stations.insert(-2, new_station) #станция добавляется в маршрут
  end

  def del_station(station)            #Метод удаления промежуточной станции из маршрута
    @stations.delete_if {|item| item === station && item != @stations.first && item != @stations.last}  #станция удаляется, если она не начальная и не конечная в маршруте
  end

end
