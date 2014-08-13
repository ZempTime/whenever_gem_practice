namespace :jobs do
  desc "updates job listings"
  task add_listings: :environment do
    range = [*'0'..'9', *'a'..'z', *'A'..'Z']
    5.times do
      Job.create(name: Array.new(8){range.sample}.join, description: Array.new(8){range.sample}.join)
    end
  end

end
