require_relative "name_company"
class CargoWagon        #Класс для создания грузового вагона
  include NameCompany
  attr_reader :type     #метод доступа к переменной экземпляра

  def initialize(type)  #конструктор класса
    @type = type
  end

end