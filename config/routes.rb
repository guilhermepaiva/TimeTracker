class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do

  constraints(SubdomainPresent) do
    devise_for :users
    root 'projects#index', as: :subdomain_root
  end

  constraints(SubdomainBlank) do
    resources :accounts, only: [:new, :create]
    root 'welcome#index'
  end

end
