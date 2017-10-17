vowels = {} #хэш для хранения гласных букв с порядковым номером в алфавите
v_sym = ["a", "e", "i", "o", "u", "y"] #Maссив  гласных букв

("a".."z").each_with_index do |letter,index| #перебираем алфавит
   
  if v_sym.include?(letter)       #при нахождении гласной
    vowels[letter] = index+1 #заносим в хэш букву и присваиваем ей порядковый номер
  end

end
puts vowels   #выводим хэш в консоль