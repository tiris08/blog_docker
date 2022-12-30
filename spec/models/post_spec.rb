require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'callbacks' do
    context 'after update' do
      describe '#do_test' do
        let(:post) { Post.create(title: '1') }

        it 'broadcasts change' do
          expect(ActionCable.server).to receive(:broadcast)
          post.update(body: '1')
        end
      end
    end
  end
end
