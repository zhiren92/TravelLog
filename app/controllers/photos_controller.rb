class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end
	def show
		album = Album.find(params[:album_id])
		@photo = album.photos.find(params[:id])
	end
	def new
		@album = Album.find(params[:album_id])
		@photo = Photo.new
		@photo = @album.photos.build
	end
	def create
		@album = Album.find(params[:album_id])
		#@photo = @album.photos.build(photo_params_create)
		
		photo_params_create[:image].each {|p| @album.photos.new(image: p)}


		if @album.save
			redirect_to album_path(@album)
		else
			render :new
		end
	end
	def edit
		@album = Album.find(params[:album_id])
		@photo = @album.photos.find(params[:id])

	end
	def update
		@album = Album.find(params[:album_id])
		@photo = @album.photos.find(params[:id])
		if @photo.update_attributes(photo_params_update)
			redirect_to album_photo_path
		else
			render "edit"
		end
	end
	def destroy
		@album = Album.find(params[:album_id])
		@photo = @album.photos.find(params[:id])
		if @photo.destroy
			redirect_to album_path(@album)
		else
			render "edit"
		end
	end

	def photo_params_update
		params.require(:photo).permit(:caption, :image => [])
	end	
	def photo_params_create
		params.require(:album).require(:photo).permit(:caption, :image => [])
	end
end
