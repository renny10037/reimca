# Work Model
class Work < ActiveRecord::Base
  include ActivityHistory
  include CloneRecord
  mount_uploader :image, ImageUploader
  belongs_to :stack_state
  belongs_to :stack_city
  belongs_to :type_project
  mount_uploader :image, ImageUploader
  validates :title,:description,:stack_state_id,:stack_city_id,:type_project_id,:contractor,:duration,:image, presence: true
  validates :image, file_size: { less_than: 2.megabytes }

  # Fields for the search form in the navbar
  def self.search_field
    :title_or_description_or_stack_state_id_or_stack_city_id_or_type_project_id_or_contractor_or_duration_or_image_cont
  end
end