Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    Rails.application.secrets.google_api_key,
    Rails.application.secrets.google_api_secret,
    name: :google
end
