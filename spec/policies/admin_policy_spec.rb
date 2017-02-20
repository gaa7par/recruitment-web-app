require 'rails_helper'

RSpec.describe AdminPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  permissions :show? do
    it { is_expected.not_to permit(user) }
    it { is_expected.to permit(admin) }
  end
end
