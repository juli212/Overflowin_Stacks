class Answer < ActiveRecord::Base
 belongs_to :user
 belongs_to :question
 has_many :comments, as: :commentable
 has_many :votes, as: :voteable

 validates :body, :question_id, :user_id, presence: true

 def points
    votes.sum(:value)
  end
end
