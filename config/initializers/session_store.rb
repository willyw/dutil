# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dutil_session',
  :secret      => '912d8a9a45ea4baee76b29370871914f37cb7f1920cd0f84a09d8d1e7f508e1201e02d2fc5094602fcbe3154bc355ba1f3fba5a9464c15683e13e41ed085cd78'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
