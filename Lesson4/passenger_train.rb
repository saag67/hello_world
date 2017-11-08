class PassengerTrain < Train    #класс для создания пассажирского поезда, наследует классу Train

  attr_reader  :name            #метод доступа к переменной экземпляра

  def initialize(name)          #конструктор класса
    super                       #вызов родительского конструктора
  end

  def attach_wagon(wagon)
    if wagon.class == PassengerWagon
    super  #вагон прицепляется, если текущая скорость поезда равна 0,
    end
  end     # и если это пассажирский вагон


end