
set -o errexit

bundle install
bundle exec rake db:migrate RAILS_ENV=production
