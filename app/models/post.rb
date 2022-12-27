class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  has_many :comments, dependent: :destroy

  after_update :do_test

  private

  def do_test
    ActionCable.server.broadcast 'test_channel', date: Time.now
  end
end
