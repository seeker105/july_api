require 'rails_helper'

RSpec.feature "user can log in" do
  include Capybara::DSL

  def setup
    Capybara.app = OauthWorkshop::Application
  end
  scenario "user visits the home page" do
    visit root_url

    expect(page.status_code).to eq(200)
  end
end
