class User < ApplicationRecord
  # Include default devise modules. Others available are:
  	include JpPrefecture
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	    :recoverable, :rememberable, :validatable

	attachment :profile_image

	has_many :books, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :chats, dependent: :destroy
	has_many :user_rooms, dependent: :destroy

	has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
	has_many :followings, through: :active_relationships, source: :follower

	has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
	has_many :followers, through: :passive_relationships, source: :following

	validates :name, presence: true, length: { in: 2..20}
	validates :introduction, length: { maximum: 50 }
	validates :postal_code, presence: true, length: { minimum: 7 }
	validates :prefecture, presence: true
	validates :city, presence: true
	validates :street, presence: true

	jp_prefecture :prefecture, method_name: :pref

	def prefecture_name
	    JpPrefecture::Prefecture.find(code: prefecture).try(:name)
	end

	def prefecture_name=(prefecture_name)
	    self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
	end

	def followed_by?(user)
		passive_relationships.find_by(following_id: user.id).present?
	end

	def user_address
		address = self.prefecture
		address += self.city
		return address
	end
end
