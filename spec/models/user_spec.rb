require 'rails_helper'

RSpec.describe User, type: :model do

  context "password create" do
    it "" do
      expect(User.create(email: 'hoge@gmail.com', password: "eeee88ee")).to be_valid
    end
  end
end
