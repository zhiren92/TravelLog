class AlbumsController < ApplicationController
	def index	
		@albums = Album.all
	end
	def show
		@album = Album.find(params[:id])
	end
	def new
		@album = Album.new
	end
	def create
		@album = Album.new(album_params)
		if @album.save
			redirect_to albums_path
		else
			render :new
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end

	private
	def album_params
		params.require(:album).permit(:name, :time_created, :about, photos_attributes: [:caption, :time, :image])
	end
end
