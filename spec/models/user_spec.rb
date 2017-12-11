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
      it 'can\'t be blank' do
        @user.first_name = nil
        @user.save
        expect(@user.errors.get(:first_name)).to include('can\'t be blank')
      end
    end

    context 'when last_name is nil' do
      it 'can\'t be blank' do
        @user.last_name = nil
        @user.save
        expect(@user.errors.get(:last_name)).to include('can\'t be blank')
      end
    end

    context 'when email is nil' do
      it 'can\'t be blank' do
        @user.email = nil
        @user.save
        expect(@user.errors.get(:email)).to include('can\'t be blank')
      end
    end

    context 'when password is nil' do
      it 'can\'t be blank' do
        @user.password = nil
        @user.save
        expect(@user.errors.get(:password)).to include('can\'t be blank')
      end
    end

    context 'when password_confirmation is nil' do
      it 'can\'t be blank' do
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors.get(:password_confirmation)).to include('can\'t be blank')
      end
    end

    context 'when password and password_confirmation are different' do
      it 'doesn\'t match password' do
        @user.password_confirmation = 'not_password'
        @user.save
        expect(@user.errors.get(:password_confirmation)).to include('doesn\'t match Password')
      end
    end

    context 'when password is empty' do
      it 'can\'t be blank' do
        @user = User.create(
          first_name: 'first',
          last_name: 'last',
          email: 'email',
          password: '',
          password_confirmation: ''
        )
        expect(@user.errors.get(:password)).to include('can\'t be blank')
      end
    end

    context 'when password_confirmation is empty' do
      it 'can\'t be blank' do
        @user = User.create(
          first_name: 'first',
          last_name: 'last',
          email: 'email',
          password: '',
          password_confirmation: ''
        )
        expect(@user.errors.get(:password_confirmation)).to include('can\'t be blank')
      end
    end

    context 'when email matches another user' do
      it 'has already been taken' do
        @another_user = User.create(
          first_name: 'first',
          last_name: 'last',
          email: 'TEST@TEST.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@another_user.errors.get(:email)).to include('has already been taken')
      end
    end

    context 'when password below minimum length' do
      it 'is too short(minimum length is 8 characters)' do
        @user = User.create(
          first_name: 'first',
          last_name: 'last',
          email: 'test@test.com',
          password: 'pass',
          password_confirmation: 'pass'
        )
        expect(@user.errors.get(:password)).to include('is too short (minimum is 8 characters)')
      end
    end
  end

  describe '.authenticate_with_credentials' do
    before(:example) do
      @user = User.create(
        first_name: 'first',
        last_name: 'last',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    context 'when credentials are correct' do
      it 'should authenticate correctly' do
        user = User.authenticate_with_credentials('test@test.com', 'password')
        expect(user).to be_truthy
      end
    end

    context 'when email is incorrect' do
      it 'should be nil' do
        user = User.authenticate_with_credentials('nottest@test.com', 'password')
        expect(user).to be_nil
      end
    end

    context 'when password is incorrect' do
      it 'should be nil' do
        user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
        expect(user).to be_nil
      end
    end

    context 'when email preceeded by spaces' do
      it 'should still be valid' do
        user = User.authenticate_with_credentials(' test@test.com', 'password')
        byebug
        expect(user)
      end
    end
  end
end
