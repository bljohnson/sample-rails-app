# Article class inherits from ApplicationRecord. ApplicationRecord inherits from ActiveRecord::Base which supplies a great deal of functionality to your Rails models for free, including basic database CRUD (Create, Read, Update, Destroy) operations, data validation, as well as sophisticated search support and the ability to relate multiple models to one another
class Article < ApplicationRecord
	has_many :comments
	# ensure that all articles have a title that is at least five characters long
	validates :title, presence: true,
				  length: { minimum: 5 }
end
