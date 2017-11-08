class CargoTrain < Train   #Класс для создания грузового поезда наследует классу Train

  attr_reader :type       #метод доступа к переменной экземпляра

  def initialize(name)    #конструктор класса
    super                 #вызов родительского конструктора
  end

  def attach_wagon(wagon)
    if wagon.class == CargoWagon
    super                  #вагон прицепляется, если текущая скорость поезда равна 0,
    end
  end                      # и если это грузовой вагон
end