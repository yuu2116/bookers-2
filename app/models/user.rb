class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy
         def posts
          return Post.where(user_id: self.id)
        end
        attachment :profile_image
        
        validates :introduction,length: {maximum: 50 }
        validates :name,presence: true,length: {in: 2..20 }
        
end
