alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
#^-это наш алфавит
vowels = Hash.new(0) #хэш для хранения гласных букв с порядковым номером в алфавите

alphabet.each do |letter| #перебираем алфавит
 #если буква из алфавита соответствует образцу
  if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u" || letter == "y"
    index = alphabet.index(letter) + 1  #вычисляем ее индекс в массиве и добавляем 1 для соответствия порядковому номеру в адфавите
    vowels[letter] = index #заносим в хэш букву и присваиваем ей порядковый номер
  end

end
puts vowels   #выводим хэш в консоль