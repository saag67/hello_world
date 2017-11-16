module InstanceCounter
  def self.included(item)
    item.extend ClassMethods
    item.send :include, InstanceMethod
  end

  module ClassMethods
    def instances
      name_variable = class_variables[0]
      class_variable_get(name_variable)
    end
  end
protected
  module InstanceMethod
    def register_instance
      name_variable = self.class.class_variables[0]
      value_variable = self.class.class_variable_get(name_variable)
      result = self.class.class_variable_set(name_variable,value_variable += 1)
    end
  end
end
