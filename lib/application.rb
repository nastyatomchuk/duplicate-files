class Application
  attr_reader :dir_path, :file_names

  def initialize(dir_path)
    @dir_path = dir_path
    @files_array = Dir.entries(@dir_path)
  end

  def self.start(dir_path)
    new(dir_path).start
  end

  def start
    count_files
    all_files
    find_duplications
  end

  def count_files
    puts "\nКол-во файлов в каталоге: #{ Dir[File.join(@dir_path, '**', '*')].count { |file| File.file?(file) }}"
  end

  def all_files
    puts "\nВывод всех файлов каталога: #{@files_array}"
  end

  def find_duplications
    puts "\nПоиск совпадений:"
    array = []
    (i = 2..@files_array.size - 1).each { |i|
      st = @dir_path + "/" + @files_array[i]
      grades = Hash.new(0)
      grades[st] = File.read(st)
      array.push(grades)
    }
      (i = 0..array.size - 1).each { |i|
      count_duplications = 0
      b = ((array[i].to_a)[0])[1]

      (j = 0..array.size - 1).each { |j|
        b1 = ((array[j].to_a)[0])[1]
        if  b == b1 and i != j
          count_duplications += 1
        end
      }
      if count_duplications == 0
        puts "\nФайл #{ ((array[i].to_a)[0])[0] } не имеет совпадений"
      else
        puts "\nФайл #{ ((array[i].to_a)[0])[0] } имеет совпадений #{ count_duplications.to_s }"
        new_arr = []
        (k = 0..array.size - 1).each { |k|
          b1 = ((array[k].to_a)[0])[1]
          if   b == b1  and i != k
            new_arr.push ((array[k].to_a)[0])[0]
          end
        }
        puts "Дубликаты: #{ new_arr }"
      end
    }
  end
end
