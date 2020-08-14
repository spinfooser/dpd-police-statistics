# frozen_string_literal: true

class Complaint < ApplicationRecord
  belongs_to :officers, optional: true
end
