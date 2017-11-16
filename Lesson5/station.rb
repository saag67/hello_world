
class Station #класс Staion для создания станий

  attr_reader :name, :trains, :stations  #методы доступа к переменным экземпляра
  def initialize(name)  #конструктор класса
    @name=name          #инииализаия переменных экземпляра
    @trains = []
  end



  def get_trains_by_type(type_train) #метод получения поездов по типу, параметр - тип поезда

    @trains.count {|train| train.type === type_train} #возвращает количество элементов, соответствующих условию

  end

  def train_arrival(train)  #метод принятия поезда на станцию
    @trains << train   #   поезд прибыл на станцию
  end

  def train_depature(train)    # метод отправки поезда со станции
    @trains.delete_if {|item| item === train} #поезд отправляется, если он есть на станции
  end

  def self.all(stations)
    stations
  end



end