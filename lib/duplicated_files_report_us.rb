require 'colorize'

class DuplicatedFilesReportRu
  def print_report(grouped_file_names)
    puts "Duplicates:".colorize(:green)
    grouped_file_names.each_value do |file_name|
      puts file_name.join(', ').colorize(:white)
    end
  end
end