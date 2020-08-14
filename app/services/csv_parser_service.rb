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
    SmarterCSV.process(csv_file_path) do |chunk|
      complaint = chunk.first
      received_date = Date.strptime(complaint[:received_date], '%Y.%m.%d') if complaint[:received_date].present?
      completed_date = Date.strptime(complaint[:completed_date], '%Y.%m.%d') if complaint[:completed_date].present?

      officer = Officer.where(id: complaint[:badge]).first if complaint[:badge]
      if complaint[:disposition] == 'Decline'
        complaint[:disposition] = 'Declined'
      end
      Complaint.create!(
          incident_id: complaint[:incident_id],
          incident_type: complaint[:incident_type],
          received_date: received_date,
          completed_date: completed_date,
          last_name: complaint[:last_name],
          first_name: complaint[:first_name],
          officer_id: officer&.id,
          allegation: complaint[:allegation],
          directive: complaint[:directive],
          finding: complaint[:finding],
          action_taken: complaint[:action_taken],
          disposition: complaint[:disposition]
      )
    end
  end

end
