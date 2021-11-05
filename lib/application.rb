class Application
  attr_reader :data_path, :files_name

  def initialize(data_path)
    @data_path = data_path
    @files_name = Dir.entries(data_path)
  end

  def self.start(data_path)
    new(data_path).start
  end

  def start
    print_count_of_files
    find_duplications
  end

  def print_count_of_files
    puts "Кол-во файлов в каталоге: #{ count_files }"
  end

  def count_files
    Dir[File.join(data_path, '**', '*')].count { |file| File.file?(file) }
  end

  def find_duplications
    puts "\nПоиск совпадений:"
    array = []
    (i = 2..files_name.size - 1).each { |i|
      st = data_path + "/" + files_name[i]
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
