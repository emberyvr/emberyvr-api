namespace :assets do
  desc 'Recompile Rails cache'
  task recompile: :environment do
    Rake::Task['assets:clobber'].invoke
    sh "RAILS_ENV=production bundle exec rake assets:precompile"
  end
end
