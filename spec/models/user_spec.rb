require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:example) do
      @user = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    context 'when all fields are filled' do
      it 'should be valid' do
        expect(@user.valid?).to be_truthy
      end
    end

    context 'when first_name is nil' do
      it 'should be invalid' do
        @user.first_name = nil
        @user.save
        expect(@user.errors.get(:first_name)).to include('can\'t be blank')
      end
    end

    context 'when last_name is nil' do
      it 'should be invalid' do
        @user.last_name = nil
        @user.save
        expect(@user.errors.get(:last_name)).to include('can\'t be blank')
      end
    end

    context 'when email is nil' do
      it 'should be invalid' do
        @user.email = nil
        @user.save
        expect(@user.errors.get(:email)).to include('can\'t be blank')
      end
    end

    context 'when password is nil' do
      it 'should be invalid' do
        @user.password = nil
        @user.save
        expect(@user.errors.get(:password)).to include('can\'t be blank')
      end
    end

    context 'when password_confirmation is nil' do
      it 'should be invalid' do
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors.get(:password_confirmation)).to include('can\'t be blank')
      end
    end

    context 'when password and password_confirmation are different' do
      it 'should be invalid' do
        @user.password_confirmation = 'not_password'
        @user.save
        expect(@user.errors.get(:password_confirmation)).to include('doesn\'t match Password')
      end
    end

    context 'when password or password_confirmation are empty' do
      it 'should be invalid' do
        @user = User.new(
          first_name: 'first',
          last_name: 'last',
          email: 'email',
          password: '',
          password_confirmation: ''
        )
        expect(@user.valid?).not_to be_truthy
      end
    end

    context 'when email matches another user' do
      it 'should be invalid' do
        @another_user = User.new(
          first_name: 'first',
          last_name: 'last',
          email: 'TEST@TEST.com',
          password: 'password',
          password_confirmation: 'password'
        )
        byebug
        expect(@another_user.valid?).not_to be_truthy
      end
    end
  end
end
