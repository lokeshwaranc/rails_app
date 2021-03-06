class Article < ApplicationRecord
	validates :title, presence: true, length: {minimum: 10, maximum: 150}
	validates :description, presence: true, length: {minimum: 25}
end