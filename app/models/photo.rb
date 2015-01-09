class Photo
  include Mongoid::Document
  field :caption, type: String
  field :time, type: Time, default: Time.now

  mount_uploader :image, PhotoUploader

  embedded_in :album
  

 
end
