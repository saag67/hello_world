class CargoTrain < Train   #Класс для создания грузового поезда наследует классу Train

  attr_reader :type       #метод доступа к переменной экземпляра

  def initialize(name)    #конструктор класса
    super                 #вызов родительского конструктора
  end

end