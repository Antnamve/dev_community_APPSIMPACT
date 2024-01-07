class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :work_experiences, dependent: :destroy
  has_many :conections, dependent: :destroy

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

  def address
    "#{city}, #{state}, #{country}, #{pincode}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[country city]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def check_if_already_connected?(current_user, user)
    current_user != user && !current_user.conections.pluck(:connected_user_id).include?(user.id)
  end
end
