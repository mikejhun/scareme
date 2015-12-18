class Track < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments
	acts_as_votable

	def self.hottest
		order(cached_votes_score: :desc).limit(5)
	end

	def self.randomest
		limit(5).order('RANDOM()')
	end

	def self.search(params)
		tracks = Track.where("body LIKE?", "%#{params[:search]}%") if params[:search].present?
		tracks
	end
end