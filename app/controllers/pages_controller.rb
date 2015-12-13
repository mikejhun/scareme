class PagesController < ApplicationController
	def toptracks
		@tracks = Track.hottest
		
	end

	def randomtracks
		@tracks = Track.randomest
	end
end