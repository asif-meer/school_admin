class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # define associations
  has_one  :school
  has_many :courses

  def self.find_or_create(attributes)
    User.where(attributes).first || User.create(attributes)
  end

  def school
    @school   = School.find_by_user_id(self.id)
    @school ||= School.new(:user_id => self.id)

  def admin?
    self.has_role? :admin
  end
end
