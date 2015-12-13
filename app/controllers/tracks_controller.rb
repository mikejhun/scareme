class TracksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]
	def index
		@tracks = Track.all.order(id: :desc).page(params[:page]).per(15)
	end

	def new
		@track = Track.new
	end
	
	def create
		@track = Track.new(track_params)
		@track.user = current_user
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

	def upvote
		@track = Track.find(params[:id])
		@track.upvote_by(current_user)
		redirect_to :back
	end

	def downvote
		@track = Track.find(params[:id])
		@track.downvote_by(current_user)
		redirect_to :back
	end

	private
		def track_params
			params.require(:track).permit(:body)
		end
end