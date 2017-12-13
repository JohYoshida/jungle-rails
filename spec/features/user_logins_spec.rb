require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  #SETUP
  before :each do
    @user = User.create!(
      first_name: 'Test',
      last_name: 'User',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario 'They log in' do
    # ACT
    visit root_path
    click_link 'Login'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'

    # DEBUG / VERIFY
    sleep(5)
    save_screenshot
    expect(page).to have_content 'Signed in as Test'
  end
end
