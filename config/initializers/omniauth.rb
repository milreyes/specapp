OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ' 277557272993-8lmc9l5q6hfs5tj4n79o97cojqj57vin.apps.googleusercontent.com', 'MV_VqvwhHaBgNJvAu89N-8XP', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end