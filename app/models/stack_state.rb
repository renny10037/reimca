class StackState < ActiveRecord::Base
	has_one :work
	has_many :stack_cities
end
