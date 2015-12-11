class TracksController < ApplicationController

	def index

	end

	def new
		@track = Track.new
	end
	
	def create
		@track = Track.new(track_params)
		if @track.save
			redirect_to @track
		else
			flash[:danger] = @track.errors.full_messages.to_sentence
			render :new
		end
	end

	def show
		@track = Track.find(params[:id])
	end

	private
		def track_params
			params.require(:track).permit(:body)
		end
end