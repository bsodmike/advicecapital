class Video < ActiveRecord::Base
  attr_accessible :title, :panda_video_id, :frontpage

  validates :frontpage, :uniqueness => true
  
  validates :panda_video_id, :presence => true

  def panda_video
    @panda_video ||= Panda::Video.find(panda_video_id)
  end
end
