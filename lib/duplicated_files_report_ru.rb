require 'colorize'

class DuplicatedFilesReportRu
  def print_report(grouped_file_names)
    puts "Отчет о дубликатах файлов (дубликаты сгруппированы построчно)".colorize(:green)
    grouped_file_names.each_value do |file_name|
      puts file_name.join(', ').colorize(:white)
    end
  end
end
