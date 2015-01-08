class Photo
  include Mongoid::Document
  field :caption, type: String
  field :time, type: Time, default: Time.now

  embedded_in :album
 
end
