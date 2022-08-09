class Favorite < ApplicationRecord


  belongs_to :user
  belongs_to :create

 validates_uniqueness_of :create_id, scope: :user_id

end
