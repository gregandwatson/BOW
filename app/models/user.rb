require 'observer'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: { message: "Please add a name." }

  has_many :articles
  has_many :comments
  acts_as_follower
  acts_as_messageable
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  # after_save :add_to_mailchimp, on: [:create]

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

end
