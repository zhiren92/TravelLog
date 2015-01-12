class Photo
  include Mongoid::Document
  field :caption, type: String

  mount_uploader :image, PhotoUploader

  embedded_in :album
  

 
end
