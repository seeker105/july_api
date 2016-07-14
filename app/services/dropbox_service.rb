class DropboxService

  def get_folder_list(current_user)
    connection = Faraday.new(url: "https://api.dropboxapi.com/2/sharing/")
    response = connection.post do |req|
      req.url "list_folders"
      req.headers['Authorization'] = ('Bearer ' + current_user.token)
      req.headers['Content-Type'] = 'application/json'
      req.body = '{"limit": 100}'
    end
    result = JSON.parse(response.body, symbolize_names: true)[:entries]
    return result
  end

  def get_folder_contents(current_user, current_path)
    connection = Faraday.new(url: "https://api.dropboxapi.com/2/files/")
    response = connection.post do |req|
      req.url "list_folder"
      req.headers['Authorization'] = ('Bearer ' + current_user.token)
      req.headers['Content-Type'] = 'application/json'
      req.body = "{\"path\": \"#{current_path}\"}"
    end
    result = JSON.parse(response.body, symbolize_names: true)[:entries]
  end
end
