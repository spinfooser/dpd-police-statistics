# frozen_string_literal: true

desc 'Populates DB from CSV data'
task populate_db_from_csv: :environment do
  CsvParserService.new.parse_officer_csv(Rails.root.join('data_files', 'officers.csv'))
  CsvParserService.new.parse_complaint_csv(Rails.root.join('data_files', 'citizen_complaints.csv'))
end

