# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  default_scope -> { order(created_at: :asc) }

  validates :role, presence: true
  enum role: { regular_user: 0, admin: 1 }
end
