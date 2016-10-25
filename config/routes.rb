Rails.application.routes.draw do

  root 'frontend#index'
  get 'frontend/index'

  resources :users
  post 'users/:id/invitation' => 'users#accept_invitation', as: 'user_accept_invitation'
  get 'users/:id/invitations' => 'users#invitations', as: 'user_invitations'
  get 'users/:id/groups' => 'users#groups', as: 'user_groups'
  post 'users/:id/ban_group' => 'users#ban_group', as: 'user_ban_group'
  post 'users/login' => 'users#login', as: 'user_login'
  post 'users/logout' => 'users#logout', as: 'user_logout'
  get 'users/:id/groups_leading' => 'users#groups_leading', as: 'user_groups_leading'
  post 'users/:id/leave_group' => 'users#leave_group', as: 'user_leave_group'
  get 'users/:id/previa_invitations' => 'users#previa_invitations', as: 'user_previa_invitations'
  

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

  resources :properties
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
