# frozen_string_literal: true

class CsvParserService
  def parse_officer_csv(csv_file_path)
    SmarterCSV.process(csv_file_path) do |chunk|
      officer = chunk.first
      did_transfer = false
      if officer[:active] == 'Yes'
        is_active = true
      else
        is_active = false
      end
      if officer[:term_date] == 'Transfer'
        officer[:term_date] = nil
        did_transfer = true
      end
      term_date = Date.strptime(officer[:term_date], '%m/%d/%Y') if officer[:term_date].present?
      rehire_date = Date.strptime(officer[:rehire_date], '%m/%d/%Y') if officer[:rehire_date].present?
      Officer.create!(
          id: officer[:badge],
          employee_id: officer[:employee_id],
          name: officer[:name],
          job_profile: officer[:job_profile],
          active: is_active,
          termination_date: term_date,
          rehire_date: rehire_date,
          transferred: did_transfer
      )
    end
  end

  def parse_complaint_csv(csv_file_path)

    complaints_file = File.new(Rails.root.join('data_files', 'citizen_complaints.csv'))
    complaints_array = SmarterCSV.process(complaints_file.path)
    pp complaints_array.first
  end

end
