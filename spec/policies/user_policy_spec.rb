require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  permissions :destroy? do
    it { is_expected.not_to permit(user, user) }
    it { is_expected.to permit(admin, user) }
    it { is_expected.not_to permit(admin, admin) }
  end
end
