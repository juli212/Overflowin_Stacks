class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  validates :body, presence: true

  def points
    votes.sum(:value)
  end
end
