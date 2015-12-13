class AddCachedVotesToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :cached_votes_total, :integer, :default => 0
    add_column :tracks, :cached_votes_score, :integer, :default => 0
    add_column :tracks, :cached_votes_up, :integer, :default => 0
    add_column :tracks, :cached_votes_down, :integer, :default => 0
    add_column :tracks, :cached_weighted_score, :integer, :default => 0
    add_column :tracks, :cached_weighted_total, :integer, :default => 0
    add_column :tracks, :cached_weighted_average, :float, :default => 0.0
    add_index  :tracks, :cached_votes_total
    add_index  :tracks, :cached_votes_score
    add_index  :tracks, :cached_votes_up
    add_index  :tracks, :cached_votes_down
    add_index  :tracks, :cached_weighted_score
    add_index  :tracks, :cached_weighted_total
  end

  def self.down
    remove_column :tracks, :cached_votes_total
    remove_column :tracks, :cached_votes_score
    remove_column :tracks, :cached_votes_up
    remove_column :tracks, :cached_votes_down
    remove_column :tracks, :cached_weighted_score
    remove_column :tracks, :cached_weighted_total
    remove_column :tracks, :cached_weighted_average
  end
end
