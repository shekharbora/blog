class User < ApplicationRecord
 attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
    binding.pry
  end

      enum status: [:qualified, :not_qualifide, :banned]
      enum role: [:Novice, :Expert]

end
