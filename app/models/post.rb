class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?
  
  def clickbait?
    if title
      unless title.include?("Won't Believe" || "Secret" || "Top [0..9]" || "Guess")
        errors.add(:title, "Not enough clickbait. Do you want to get clicked or not?")
      end
    end
  end
  
end
