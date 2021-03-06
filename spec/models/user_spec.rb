require 'rails_helper'

describe User, type: :model do
  describe 'Creation' do
    let(:test_user) { create(:user) }

    context 'when user is created' do
        it 'should be valid' do
          expect(test_user).to be_valid
      end
    end
  end
  it { should have_many(:orders) }
  
end


