class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@track = Track.find(params[:track_id])
		@comment = @track.comments.create(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to :back
		else
			flash[:danger] = @comment.errors.full_messages.to_sentence
			render :new
		end
	end


	private
		def comment_params
			params.require(:comment).permit(:body)
		end

end