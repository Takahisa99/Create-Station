class Create < ApplicationRecord


  has_one_attached :image
  belongs_to :user

#コメント機能
  has_many :creates_comments, dependent: :destroy
#いいね機能
  has_many :favorites, dependent: :destroy

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @create = Create.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @create = Create.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @create = Createk.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @create = Create.where("title LIKE?","%#{word}%")
    else
      @create = Create.all
    end
  end







end
