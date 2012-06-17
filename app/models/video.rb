class Video < ActiveRecord::Base
  attr_accessible :title, :panda_video_id
  
  validates :panda_video_id, :presence => true

  def panda_video
    @panda_video ||= Panda::Video.find(panda_video_id)
  end
end
