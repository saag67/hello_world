require_relative "name_company"
class PassengerWagon    #Класс для создания пассажирского вагона
  include NameCompany
  attr_reader :type     #метод доступа для переменной экземпляра

  def initialize(type)  #конструктор класса
    @type = type
  end

end