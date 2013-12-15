# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Default: SampleApp::Application.config.secret_key_base = '3016982724978eb5942643c9eefabf3f86c3fccaf03bf5228caa8aea0afddd72dad031f05f8349df13106bcd14af5adf4568b6153966cc7c28be27013850667e'

require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
        File.read(token_file)
        # Use the existing token
    else
        # Generate a new token and store it in the token file.
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end

SampleApp::Application.config.secret_key_base = secure_token
