class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable,  :validatable
  validates :name, presence: true, length: {maximum: 50}
  has_many :photos
  has_many :comments
  def user?
  	!self.admin?	
  end 		
end
