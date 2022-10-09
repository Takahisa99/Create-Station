class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :creates, dependent: :destroy

  #いいね機能
  has_many :favorites, dependent: :destroy

  #コメント機能
  has_many :create_comments, dependent: :destroy

 #閲覧数
  has_many :view_counts, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }

 #ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com' ) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.introduction = "ゲストです。"
    end
  end

  def is_guest
    if name == "guestuser" && email == "guest@example.com"
      return true
    end
    false
  end



 #画像投稿
  has_one_attached :profile_image

 #プロフィール画像
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

# 検索方法分岐
  def self.looks(word)
      @user = User.where("name LIKE?","%#{word}%")
  end

#退会機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end



    #フォロー機能

    has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

    #一覧画面で使用する場合
    has_many :followings, through: :relationships, source: :followed
    has_many :followers, through: :reverse_of_relationships, source: :follower

    # フォローしたときの処理
    def follow(user_id)
      relationships.create(followed_id: user_id)
    end
    # フォローを外すときの処理
    def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
    end
    # フォローしているか判定
    def following?(user)
      followings.include?(user)
    end




end
