require 'digest'

class Application
  attr_reader :data_path, :file_names, :digester, :hash_files, :files, :grouped_file_names

  def initialize(data_path, digester)
    @data_path = data_path
    @file_names = Dir.entries(data_path).select {|f| !File.directory? f}
    @digester = digester
    @grouped_file_names = Hash.new { [] }
  end

  def self.start(data_path,  digester)
    new(data_path, digester).start
  end

  def start
    print_files_count
    find_duplications
  end

  def print_files_count
    puts "Кол-во файлов в каталоге: #{  file_names.count}"
  end

  def find_duplications
    puts "Дубликаты:"

    file_names.each do |file_name|
      full_file_name = File.join( data_path , file_name)
      digest = digester.digest(full_file_name)
      grouped_file_names[digest] <<= file_name
    end

    grouped_file_names.each do |file_name|
        file_name[1].each do |name|
          print "#{name} "
        end
        puts
    end
  end
end
