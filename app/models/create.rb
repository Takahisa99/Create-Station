class Create < ApplicationRecord


  has_one_attached :image
  belongs_to :user
  belongs_to :genre
#コメント機能
  has_many :create_comments, dependent: :destroy
#いいね機能
  has_many :favorites, dependent: :destroy


  validates :name, presence:true
  validates :image, presence: true
  validates :introduction, presence:true,length:{maximum:200}


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end



  # 検索方法分岐
  def self.looks(word)
      @create = Create.where("name LIKE?","%#{word}%")
  end

  # ランキング検索
  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:create_id).order(Arel.sql('count(create_id) desc')).pluck(:create_id))
    when 'dislikes'
      return find(Favorite.group(:create_id).order(Arel.sql('count(create_id) asc')).pluck(:create_id))
    end
  end



  validates :name,presence:true
  validates :introduction,presence:true,length:{maximum:200}


  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


end
