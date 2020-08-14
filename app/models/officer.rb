# frozen_string_literal: true

class Officer < ApplicationRecord
  has_many :complaints
end
