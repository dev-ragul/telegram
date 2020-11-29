GOOGLE_CLIENT_ID = "745044251653-16k7iadr53nl3ua5gk1imvk171f4q556.apps.googleusercontent.com"
GOOGLE_CLIENT_SECRET = "0LD4sq_DVTgaN3jvlo0SaYQD"


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['745044251653-16k7iadr53nl3ua5gk1imvk171f4q556.apps.googleusercontent.com'], ENV['0LD4sq_DVTgaN3jvlo0SaYQD']
end