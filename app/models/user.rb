class User < ActiveRecord::Base

  def self.from_auth(auth_info)
    where(uid: auth_info.uid).first_or_create do |new_user|
      new_user.uid    = auth_info.uid
      new_user.full_name = auth_info.info.name
      new_user.first_name   = auth_info.extra.raw_info.name_details.familiar_name
      new_user.last_name   = auth_info.extra.raw_info.name_details.surname
      new_user.email  = auth_info.info.email
      new_user.token  = auth_info.credentials.token
    end
  end
end
