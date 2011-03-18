if Rails.env == "development" || Rails.env == "test"
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
end