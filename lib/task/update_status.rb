module UpdateStatus
  @queue = :z33z
  
  def self.perform post_id
    require_relative '../db/connection'
    require_relative '../db/post'
    post = Post[post_id]
    sleep 15
    post.update(status: 'SUCCESS')
  end
end