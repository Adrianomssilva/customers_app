class Customer < ApplicationRecord

  validates :name, :email, :cellphone, :birthday, presence: true

  enum status: {active: 0 , inactive: 3}

  def full_name
    "#{name} #{last_name}"
  end

  def address
    "#{street}, n #{number}, #{complement}. #{city}, #{state}"
  end
end
