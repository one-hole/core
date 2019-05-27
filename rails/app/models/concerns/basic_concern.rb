module BasicConcern
  extend ActiveSupport::Concern

  @basic_db ||= YAML.load_file(File.join(Rails.root, "config", "database.yml"))[Rails.env.to_s]
  ActiveRecord::Base.establish_connection @basic_db
end