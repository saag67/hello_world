vowels = {} #хэш для хранения гласных букв с порядковым номером в алфавите

("a".."z").each_with_index do |letter,index| #перебираем алфавит
 
  v_sym=["a","e","i","o","u","y"] #Maccbd гласных букв
  if v_sym.include?(letter)       #при нахождении гласной
    vowels[letter] = index+1 #заносим в хэш букву и присваиваем ей порядковый номер
  end

end
puts vowels   #выводим хэш в консоль