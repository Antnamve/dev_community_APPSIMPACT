class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  PROFILE_TITLE = [
    'Senior Ruby on Rails Developer',
    'Junior Full Stack Ruby on Rails Developer',
    'Senior Full Stack Ruby on Rails Developer',
    'Senior Java Developer',
    'Senior Front End Developer'
  ].freeze

  def name
    "#{first_name} #{last_name}".strip
  end
end
