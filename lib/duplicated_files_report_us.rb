require 'colorize'

class DuplicatedFilesReportUS
  def print_report(grouped_file_names)
    puts "Dile duplicate report (duplicates are grouped line by line)".colorize(:green)
    grouped_file_names.each_value do |file_name|
      puts file_name.join(', ').colorize(:white)
    end
  end
end
