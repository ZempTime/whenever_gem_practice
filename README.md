If you're using rbenv, you need to set a custom job type so whenever
will hit the rbenv shims. The default job types, such as rake don't.

For example:

    job_type :rbenv_rake, %Q{export PATH=/opt/rbenv/shims:/opt/rbenv/bin:/usr/bin:$PATH; eval "$(rbenv init -)"; \
                         cd :path && bundle exec rake :task --silent :output }

Other useful tidbits:

    set :environment, :development #useful for testing in development
    set :output, 'tmp/whenever.log' #logging

various formats:

    #every so often
    every 2.minutes do 
      rbenv_rake "jobs:add_listings"
    end


    #at a certain time every week
    every :friday, at: '4:40am' do
      rbenv_rake "jobs:add_listings"
    end

To write the crontab from your schedule.rb file:

    whenever -w

To view your crontab:

    crontab -l

To delete your crontab

    whenever -c
    
