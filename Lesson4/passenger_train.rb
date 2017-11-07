class PassengerTrain < Train    #класс для создания пассажирского поезда, наследует классу Train

  attr_reader  :name            #метод доступа к переменной экземпляра

  def initialize(name)          #конструктор класса
    super                       #вызов родительского конструктора
  end

  def attach_wagon(wagon)
    @wagons << wagon if @current_speed == 0 && wagon.class == PassengerWagon  #вагон прицепляется, если текущая скорость поезда равна 0,
  end                                                                     # и если это пассажирский вагон

  def detach_wagon(wagon)
    @wagons.delete(wagon) if @current_speed == 0 && @wagons.length > 0 && wagon.class == PassengerWagon  #вагон отцепляется, если значение текущей скорости равно 0 и количество вагонов больше 0
  end                                                                     # и если это пассажирский вагон

end