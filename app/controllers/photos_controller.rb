class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end
	def show
	end
	def new
		@photo = Photo.new
	end
	def create
		album = Album.find(params[:album_id])
		photo = album.photo.create(photo_params)
		redirect_to album_path(photo.album)
	end
	def destroy
	end

	def photo_params
		params.require(:photo).permit(:caption, :time, :image)
	end
end
