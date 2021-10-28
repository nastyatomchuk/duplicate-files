class Compare
  def initialize
    puts "Класс Compare создан"

  end
  def CountFiles( dir)
    puts "Кол-во файлов в каталоге:"
    @dir = dir + "/data/"
    @arr= Dir.entries(@dir)
    puts Dir[File.join(@dir, '**', '*')].count { |file| File.file?(file) }
  end

  def AllFiles
    puts "Вывод всех файлов каталога:"
    puts @arr
  end
  def FindDuplications
    puts "Поиск совпадений:"

    array = []

    (i=2..@arr.size-1).each { |i|
      st = @dir + @arr[i]
      im1 = File.read(st)
      grades = Hash.new(0)
      grades[st] = im1
      array.push(grades)
    }

    (i = 0..array.size-1).each { |i|
      count_duplications = 0
      b = (( array[i].to_a)[0])[1]

      (j = 0..array.size-1).each { |j|
        b1 = ((array[j].to_a)[0])[1]
        if  b == b1 and i!=j
          count_duplications = count_duplications+1
        end
      }

      if count_duplications == 0
        puts "Файл " +  ((array[i].to_a)[0])[0].to_s + " не имеет совпадений"
      else
        puts "Файл " + ((array[i].to_a)[0])[0].to_s + " имеет совпадений " + count_duplications.to_s
        newArr=[]
        (k=0..array.size-1).each { |k|
          b1 = ((array[k].to_a)[0])[1]
          if   b == b1  and i!=k
            #puts ((array[k].to_a)[0])[0]

            newArr.push((((array[k].to_a)[0])[0]))
          end
        }
        puts "Дубликаты: "
        puts  newArr
      end
    }
  end
end