module ArcWardenConcern
  extend ActiveSupport::Concern
  @aw_db ||= YAML.load_file(File.join(Rails.root, "config", "database_aw.yml"))[Rails.env.to_s]
  establish_connection @aw_db
end