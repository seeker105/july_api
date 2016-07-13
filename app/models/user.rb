class User < ActiveRecord::Base

  def create(auth_info)
    byebug
    @service = DropboxService.new
    user_data = @service.get_user_data(uid)
  end
end
