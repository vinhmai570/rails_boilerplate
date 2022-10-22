# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include SpreadsheetArchitect
  primary_abstract_class
end
