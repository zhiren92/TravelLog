class Album
  include Mongoid::Document
  field :name, type: String
  field :time_created, type: Time, default: Time.now
  field :about, type: String

  # mount_uploader :image, PhotoUploader
  embeds_many :photos, cascade_callbacks: true

  accepts_nested_attributes_for :photos

end
