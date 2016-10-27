Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'frontend#index'
  get 'frontend/index'

  resources :users
  post 'users/:id/accept_invitation' => 'users#accept_invitation', as: 'user_accept_invitation'
  post 'users/:id/reject_invitation' => 'users#reject_invitation', as: 'user_reject_invitation'
  get 'users/:id/invitations' => 'users#invitations', as: 'user_invitations'
  get 'users/:id/groups' => 'users#groups', as: 'user_groups'
  post 'users/:id/ban_group' => 'users#ban_group', as: 'user_ban_group'
  post 'users/login' => 'users#login', as: 'user_login'
  post 'users/logout' => 'users#logout', as: 'user_logout'
  get 'users/:id/groups_leading' => 'users#groups_leading', as: 'user_groups_leading'
  post 'users/:id/leave_group' => 'users#leave_group', as: 'user_leave_group'
  get 'users/:id/previa_invitations' => 'users#previa_invitations', as: 'user_previa_invitations'
  get 'users/:id/inbox' => 'users#inbox', as: 'user_inbox'
  

  resources :previa_groups
  post 'previa_groups/:id/invite_user' => 'previa_groups#invite_user', as: 'previa_group_invite_user'
  get 'previa_groups/:id/invitable_users' => 'previa_groups#invitable_users', as: 'previa_group_invitable_users'
  post 'previa_groups/:id/ban_group' => 'previa_groups#ban_group', as: 'previa_group_ban_group'
  post 'previa_groups/:id/invite_group' => 'previa_groups#invite_group', as: 'previa_group_invite_group'
  post 'previa_groups/:id/accept_previa_invitation' => 'previa_groups#accept_previa_invitation', as: 'previa_group_accept_previa_invitation'
  post 'previa_groups/:id/reject_previa_invitation' => 'previa_groups#reject_previa_invitation', as: 'previa_group_reject_previa_invitation'
  get 'previa_groups/:id/current_users' => 'previa_groups#current_users', as: 'previa_group_current_users'
  post 'previa_groups/:id/finish' => 'previa_groups#finish', as: 'previa_group_finish'
  get 'previa_groups/:id/details' => 'previa_groups#details', as: 'previa_group_details'
  get 'previa_groups/:id/search_previa_groups' => 'previa_groups#search_previa_groups', as: 'previa_group_search_previa_groups'
  get 'previa_groups/:id/inbox' => 'previa_groups#inbox', as: 'previa_group_inbox'
  get 'previa_groups/:id/chat' => 'previa_groups#chat', as: 'previa_group_chat'
  post 'previa_groups/:id/send_message' => 'previa_groups#send_message', as: 'previa_group_send_message'

  resources :properties
end
