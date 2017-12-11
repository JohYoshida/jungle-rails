require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'when all fields are filled' do
      it 'should be valid' do
        @user = User.new(
          first_name: 'first',
          last_name: 'last',
          email: 'email',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user.valid?).to be_truthy
      end
    end
  end

end
