require 'digest'

class Duplicated_files_registry
  attr_reader :data_path, :file_names, :digester, :grouped_file_names

  def initialize(data_path, digester)
    @data_path = data_path
    @file_names = Dir.entries(data_path).select {|f| !File.directory? f}
    @digester = digester
    @grouped_file_names = Hash.new { [] }
  end

  def group_file_names
    file_names.each do |file_name|
      full_file_name = File.join( data_path , file_name)
      digest = digester.digest(full_file_name)
      grouped_file_names[digest] <<= file_name
    end
    return  grouped_file_names
  end
end
