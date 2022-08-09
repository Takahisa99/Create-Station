class Create < ApplicationRecord


  has_one_attached :image
  belongs_to :user
#コメント機能
  has_many :create_comments, dependent: :destroy
#いいね機能
  has_many :favorites, dependent: :destroy


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end



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


  validates :name,presence:true
  validates :introduction,presence:true,length:{maximum:200}


  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end


end
