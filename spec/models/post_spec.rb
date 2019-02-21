require 'rails_helper'

RSpec.describe Post, type: :model do
  describe ".create" do
    let(:not_login_create_post){ create(:post) }
    let(:create_post) do
      current_user.posts.
        build(title: "test", content: "0123456789" ).
        save
    end

    context "when not login" do
      it "shows ActiveRecord error" do
        expect{ not_login_create_post }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context "when login and use shared_context" do
      include_context :login
      it "create post" do
        create_post
        expect(Post.count).to eq 1
      end
    end

    context "when login and not use shared_context" do
      it "create post error" do
        expect{ login_post }.to raise_error NameError
      end
    end

    context "when use relation facotory_bot" do
      it "create post" do
        create(:post, :user_relation)
        expect(Post.count).to eq 1
      end
    end
  end
end
