class Dlibhydra::AuthsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_authorities
    copy_file "authorities/licenses.yml", "config/authorities/licenses.yml"
  end
end
