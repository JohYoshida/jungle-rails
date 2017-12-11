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

    context 'when first_name is nil' do
      it 'should be invalid' do
        @user = User.new(
          last_name: 'last',
          email: 'email',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user.valid?).not_to be_truthy
      end
    end

    context 'when last_name is nil' do
      it 'should be invalid' do
        @user = User.new(
          first_name: 'first',
          email: 'email',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user.valid?).not_to be_truthy
      end
    end

    context 'when email is nil' do
      it 'should be invalid' do
        @user = User.new(
          first_name: 'first',
          last_name: 'last',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user.valid?).not_to be_truthy
      end
    end

    context 'when password is nil' do
      it 'should be invalid' do
        @user = User.new(
          first_name: 'first',
          last_name: 'last',
          email: 'email',
          password_confirmation: 'password'
        )
        expect(@user.valid?).not_to be_truthy
      end
    end
  end
end
