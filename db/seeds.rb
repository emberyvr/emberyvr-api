# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

COMPANIES_TO_CREATE = []

######################
## Basic constructors
######################
def create_company(options = {})
  options[:name] ||= Faker::Company.name
  options[:description] ||= Faker::HarryPotter.quote
  options[:team_size] ||= Faker::Number.number(2)
  options[:logo] ||= Faker::LoremPixel.image

  company = Company.new options
  COMPANIES_TO_CREATE.push company
end

####################
## Build things
####################
def build_all_the_things
  p 'Creating company'
  20.times do
    create_company
  end
end

####################
## Run things
####################
def save_all_the_things
  p 'Saving Companies'
  COMPANIES_TO_CREATE.each(&:save)
end

build_all_the_things
save_all_the_things
