class Tweet < ApplicationRecord
  belongs_to :user

  validates :text,  presence: true
  validates_length_of :text, :maximum => 280
end
