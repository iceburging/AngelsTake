# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_AngelsTake_session',
  :secret      => '7d8569573b41ae0f55f44854e5454134eafcb1daf3c8acf4d1dc6bca995d16ac07fb7b2feb87a9ccd87b7b2a58320ad8dda60de2587e8e1f4b7bd14816e892be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
