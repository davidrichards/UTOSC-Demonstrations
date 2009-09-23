# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_utosc_session',
  :secret      => '705de563a2b95725805c48fed563cf25dd280599c61a5dba7ef8b6a73ce916de6ee91a2a0844f2e916820edee370d313c9b6108abe08419b8c80c02db2d3becd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
