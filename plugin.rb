# name: discourse-change-email
# about: Change email for users without confirmation
# version: 1.0
# authors: michael@discoursehosting.com
# url: https://www.discoursehosting.com/

PLUGIN_NAME ||= "discourse-change-email".freeze

after_initialize do

  module ::AppendUsersEmailController
    def update_confirmed
      params.require(:email)
      user = fetch_user_from_params
      user.email = params[:email]
      user.save!
      user.email_tokens.update_all(confirmed: true)
      render body: nil
    end   
  end
  
  class ::UsersEmailController 
    prepend AppendUsersEmailController
  end

  Discourse::Application.routes.prepend do
    put "users/:username/preferences/email_confirmed" => "users_email#update_confirmed", constraints: { username: RouteFormat.username }
  end
end

