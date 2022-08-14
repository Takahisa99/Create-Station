class Genre < ApplicationRecord

    has_many :creates, dependent: :destroy
    validates :name, presence:true, length:{maximum:20}


# 検索方法分岐
#   def self.looks(search, word)
#     if search == "perfect_match"
#       @user = User.where("genre LIKE?", "#{word}")
#     elsif search == "forward_match"
#       @user = User.where("genre LIKE?","#{word}%")
#     elsif search == "backward_match"
#       @user = User.where("genre LIKE?","%#{word}")
#     elsif search == "partial_match"
#       @user = User.where("genre LIKE?","%#{word}%")
#     else
#       @user = User.all
#     end
#   end


end
