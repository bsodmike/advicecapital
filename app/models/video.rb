class Video < ActiveRecord::Base
	before_destroy :delete_panda_video

  attr_accessible :title, :panda_video_id, :frontpage

  validates :frontpage, :uniqueness => true
  
  validates :panda_video_id, :presence => true

  def panda_video
    @panda_video ||= Panda::Video.find(panda_video_id)
  end

  def delete_panda_video
	  Panda::Video.delete(self.panda_video_id)
  end

end
