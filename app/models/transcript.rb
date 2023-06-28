class Transcript < ApplicationRecord
    validates :transcript_text, presence: true
    validates :transcript_text, length: { maximum: 1000 }
end
