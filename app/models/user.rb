
  #ASH: model generated as a result of rails generate devise User (devise is an authentication gem)
class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Others available are :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
