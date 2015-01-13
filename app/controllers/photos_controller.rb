class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end
	def show
		album = Album.find(params[:album_id])
		@photo = album.photos.find(params[:id])
	end
	def new
		@photo = Photo.new
	end
	def create
		album = Album.find(params[:album_id])
		photo = album.photo.create(photo_params)
		redirect_to album_path(photo.album)
	end
	def edit
		@album = Album.find(params[:album_id])
		@photo = @album.photos.find(params[:id])

	end
	def update
		@album = Album.find(params[:album_id])
		@photo = @album.photos.find(params[:id])
		if @photo.update_attributes(photo_params)
			redirect_to album_photo_path
		else
			render "edit"
		end
	end
	def destroy
		@album = Album.find(params[:album_id])
		@photo = @album.photos.find(params[:id])
	end

	def photo_params
		params.require(:photo).permit(:caption, :image)
	end
end
