# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_income_session',
  :secret      => 'ec80dfc3542597a2ca70a6656def9dc0924750b38b8e3391ab6ab8b85dfa9677088f5f7ae15a68f13743b233eb9c69a74f0cdeabe498bc1e45cff930a6d127f8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
