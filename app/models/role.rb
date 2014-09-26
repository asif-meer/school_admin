class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify

  # validations
  validates_presence_of :name

  def self.find_or_create(attributes)
    Role.where(attributes).first || Role.create(attributes)
  end
end
