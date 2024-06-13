class SearchQuery < ApplicationRecord
  after_initialize :set_defaults

  private

  def set_defaults
    self.count ||= 1
  end
end
