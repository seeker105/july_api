require 'rails_helper'

RSpec.feature "user can log in" do
  include Capybara::DSL

  before(:each) do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:dropbox_oauth2]
  end

  def setup
    # Capybara.app = OauthWorkshop::Application
    stub_omniauth
  end

  scenario "user visits the home page" do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:dropbox_oauth2]
    # Capybara.app = OauthWorkshop::Application
    stub_omniauth

    visit root_url
    expect(page.status_code).to eq(200)
    click_link "Login to Dropbox"
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:dropbox_oauth2] = OmniAuth::AuthHash.new({
      provider: 'dropbox_oauth2',
      uid:      '1234',
      credentials: {
        token: ENV['test_token']
                   },
      info:     {
        name:  "Jake Anybody",
        email: "focault9@gmail.com",
                },
      extra:    {
        raw_info: {
          name_details: {
            familiar_name:  "Jake",
            surname:        "Anybody"
                        }
                  }
                }
      })
  end
end
