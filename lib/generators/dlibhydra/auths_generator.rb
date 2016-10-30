class Dlibhydra::AuthsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_authorities
    copy_file "authorities/licenses.yml", "config/authorities/licenses.yml"
  end

  def copy_qa_local
    copy_file "qa_local.rb", "config/initializers/qa_local.rb"
  end
end
