require 'rails_helper'

RSpec.describe User, type: :model do

  describe ".create" do
    context "does not use Factory bot" do
      it "create User" do
        User.create(name: "hoge", password: "hoge")
        expect(User.count).to eq 1
      end
    end

    context "use Factory bot" do
      before{ create(:user) }
      it "User create" do
        expect(User.count).to eq 1
      end
      # before節のスコープに注意
      it "not eq count 0" do
        expect(User.count).not_to eq 0
      end
    end
  end
end
