class Url < ApplicationRecord
end

class Url < ApplicationRecord
    validates :original_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
    before_create :create_short_url
  
    def create_short_url
      self.short_url = SecureRandom.hex(3)
    end
  end