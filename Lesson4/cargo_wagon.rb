class CargoWagon        #Класс для создания грузового вагона

  attr_reader :type     #метод доступа к переменной экземпляра

  def initialize(type)  #конструктор класса
    @type = type
  end

end