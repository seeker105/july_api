class DropboxService

  def initialize
  end

  def login
    @connection = Faraday.new(url: "https://www.dropbox.com/oauth2/authorize")
    response = @connection.get do |req|
      req.params['client_id'] = ENV['API_key']
      req.params['response_type'] = "token"
      req.params['redirect_uri'] = "http://127.0.0.1:3000/auth/dropbox/callback"
    end
    result = JSON.parse(response.body)
  end


  def get_user_data(token)
    @connection = Faraday.new(url: "https://api.dropboxapi.com/2/users/get_account")
    response = @connection.get do |req|
      req.header['Authorization'] = ""
      req.header['response_type'] = ""
      req.params['redirect_uri'] = "http://127.0.0.1:3000/auth/dropbox/callback"
    end
    result = JSON.parse(response.body)
    byebug
    return result
  end

  def get_account_id(token)
    @connection = Faraday.new(url: "https://api.dropboxapi.com/oauth2/token")
    response = @connection.post do |req|
      req.params['code'] = token
      req.params['grant_type'] = "authorization_code"
      req.params['client_id'] = ENV['API_key']
      req.params['client_secret'] = ENV['API_secret']
      req.params['redirect_uri'] = "http://127.0.0.1:3000/auth/dropbox/callback"
    end
    result = JSON.parse(response.body)
    byebug
    return result
  end
end
