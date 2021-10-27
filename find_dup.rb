puts "Кол-во файлов в каталоге:"
dir = 'D:/data/'
puts Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }

puts "Вывод всех файлов каталога:"
arr = Dir.entries(dir)
puts arr

puts "Поиск совпадений:"
i=2
j=2
c=0
d=0
(i..arr.size-1).each { |i|
  c=0
  st = dir + arr[i]
  im1 = File.read(st)
  (j..arr.size-1).each { |j|

    st1 = dir + arr[j]
    im2 = File.read(st1)

    if  im1 == im2 and i!=j
      c=c+1
    end

  }

  if c==0
    puts "Файл " +  arr[i] + " не имеет совпадений"
  else
    puts "Файл " +  arr[i] + " имеет совпадений " + c.to_s

    (j..arr.size-1).each { |j|
      st1 = dir + arr[j]
      im2 = File.read(st1)
      if  im1 == im2 and i!=j
        puts st1
      end

    }
  end
}
