Rails.application.routes.draw do
  root 'smtp_ninja#new'

  post 'send_mail' => 'smtp_ninja#send_mail'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
