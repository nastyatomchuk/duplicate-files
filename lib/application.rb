class Application
  attr_reader :data_path, :file_names, :digester, :report, :grouped_file_names, :registry

  def initialize(data_path, digester, report)
    @data_path = data_path
    @file_names = Dir.entries(data_path).select {|f| !File.directory? f}
    @digester = digester
    @report = report
  end

  def self.start(data_path,  digester, report)
    new(data_path, digester, report).start
  end

  def start
    registry = Duplicated_files_registry.new(data_path, digester)
    report.print_report(registry.group_file_names)
  end

end
