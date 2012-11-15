class AddYoutubeVideoIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :youtube_video_id, :string
  end
end
