# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile,dependent: :destroy

  delegate :birthday, :age, :department, to: :profile, allow_nil: true

  def has_written(board)
    boards.exists?(id: board.id)
  end

  def has_have(task)
    tasks.exists?(id: task.id)
  end

  def display_name
    # if profile && profile.name
    #     profile.name
    # else
    #     self.email.splist('@').first
    profile&.name || self.email.split('@').first
  end

  #delegateで引っ張ってこれる
  # def department
  #   profile&.department
  # end

  # def birthday
  #   profile&.birthday
  # end

  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'Oval.png'
    end
  end

end
