class CreateComment < ApplicationRecord


  belongs_to :user
  belongs_to :create

  #validates :comment, presence: true
end
