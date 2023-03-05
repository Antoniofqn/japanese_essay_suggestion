require 'roo'

desc "Import grammatical constructions from xlsx file"
task :import_grammatical_constructions => :environment do
  xlsx = Roo::Spreadsheet.open('public/grammatical_constructions.xlsx')
  sheet = xlsx.sheet(0)

  sheet.each_row_streaming(offset: 1) do |row| # Start processing from the second row
    level = row[0].value
    construction = row[1].value
    explanation = row[2].value

    GrammaticalConstruction.create(level: level, construction: construction, explanation: explanation)
  end
end
