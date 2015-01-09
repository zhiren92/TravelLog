module AlbumsHelper
	def test_album
		@test ||= Album.find_by(_id: "54af4b395a696c034c180000")
		
	end
end
