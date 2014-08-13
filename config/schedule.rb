set :environment, :development
set :output, 'tmp/whenever.log'

job_type :rbenv_rake, %Q{export PATH=/opt/rbenv/shims:/opt/rbenv/bin:/usr/bin:$PATH; eval "$(rbenv init -)"; \
                         cd :path && bundle exec rake :task --silent :output }

every 2.minutes do 
  rbenv_rake "jobs:add_listings"
end
