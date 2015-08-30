class Result < ActiveRecord::Base
  belongs_to :typeform

  validates :token, presence: true, uniqueness: true
end
