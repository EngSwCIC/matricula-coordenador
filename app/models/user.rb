# frozen_string_literal: true

# Model dos usuários do sistema. O email é obrigatório para salvar
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :credit_forms
  has_many :reminders
  belongs_to :course, optional: true

  validates :email, presence: true
end
