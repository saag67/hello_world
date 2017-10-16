months={                      #хэш с названием месяцев года в качестве ключа и количеством дней в качестве значения
  january: 31,                #
  february: 28,               #
  march: 31,                  #
  april: 30,                  #
  may: 31,                    #
  june: 30,                   #
  july: 31,                   #
  august: 31,                 #
  september: 30,              #
  october: 31,                #
  november: 30,               #
  december: 31
}

months.each do |month,days|   #перебираем хэш
                                          #если число дней в месяе равно 30
    puts month if days==30                 #печатаем месяц

end
