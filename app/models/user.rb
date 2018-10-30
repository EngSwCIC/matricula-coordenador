class User < ApplicationRecord
  rolify :role_cname => 'Coordinator'
  rolify :role_cname => 'Admin'
  rolify :role_cname => 'Student'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end
end
