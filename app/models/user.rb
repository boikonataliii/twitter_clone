class User < ApplicationRecord
  has_secure_password
  has_many :tweets

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id",  dependent:  :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :email, :first_name, :last_name,  presence: true
  validates_confirmation_of :password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>, default_url:  https://www.neolutionesport.com/wp-content/uploads/2017/03/default-avatar-knives-ninja.png"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


    def follow(other_user)
      following << other_user
    end

    def unfollow(other_user)
      following.delete(other_user)
    end

    def following?(other_user)
      following.include?(other_user)
    end
end
