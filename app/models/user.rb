class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:user, :member, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    
end
