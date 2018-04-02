# This is the Application Record class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def update_without_password(params, *options)
    params.delete(:password)
    params.delete(:password_confirmation)

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
