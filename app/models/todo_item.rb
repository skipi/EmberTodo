class TodoItem < ActiveRecord::Base
  attr_accessible :content, :done, :title
  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :content, presence: true, length: {minimum: 3, maximum: 255}
end
