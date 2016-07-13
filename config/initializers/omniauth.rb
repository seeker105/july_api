Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dropbox_oauth2, ENV['API_key'], ENV['API_secret']
end
