class PassengerTrain < Train    #класс для создания пассажирского поезда, наследует классу Train

  attr_reader  :name            #метод доступа к переменной экземпляра

  def initialize(name)          #конструктор класса
    super                       #вызов родительского конструктора
  end

end