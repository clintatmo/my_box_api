class ApplicationController < ActionController::API
  include ActionController::Serialization
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds
end
