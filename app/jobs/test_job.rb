class TestJob < ApplicationJob
  queue_as :default

  def perform(id)
    sleep 5
    Post.find(id).comments.create(
      name: 'TestJob', 
      message: "test comment from TestJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"
    )
  end
end