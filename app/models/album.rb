class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :date_of_event, type: Date
  field :about, type: String

  # mount_uploader :image, PhotoUploader
  embeds_many :photos, cascade_callbacks: true
  belongs_to :user

  accepts_nested_attributes_for :photos

end
