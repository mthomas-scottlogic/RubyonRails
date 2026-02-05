class ApplicationController < ActionController::Base
  # include Authentication
  def current_user
    auth_header = request.headers["Authorization"]
    return nil unless auth_header.present?

    token = auth_header.split(" ").last
    begin
      decoded_token = JWT.decode(token, "my-secret", true, algorithm: "HS256")
      user_id = decoded_token[0]["user_id"]
      User.find_by(id: user_id)
    rescue JWT::DecodeError
      nil
    end
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
