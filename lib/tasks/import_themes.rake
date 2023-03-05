require 'roo'

desc 'Import themes from Excel file'
task :themes => :environment do
  file_path = 'public/temas.xlsx'
  xlsx = Roo::Excelx.new(file_path)
  xlsx.each_row_streaming(offset: 1) do |row|
    Theme.create(title: row[0]&.value)
  end
end
