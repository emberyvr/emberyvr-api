namespace :db do
  desc 'Dumps Postgres database to Rails.root/tmp'
  task :dump  => :environment do
    puts 'Downloading a backup'
    sh 'curl -o tmp/latest.dump `heroku pg:backups public-url`'
    puts 'Downloaded PG backup to tmp/latest.dump'
  end

  desc 'Loads latest PG backup to database'
  task :load => :environment do
    sh "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U #{ENV['DATABASE_OWNER']} -d #{ENV['DATABASE_NAME']} tmp/latest.dump"
  end
end
