RSpec.shared_context :login do
  let(:user) { create(:user) }
  let(:current_user) do
    User.find_by(id: user.id)
  end
end
