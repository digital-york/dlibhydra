class Dlibhydra::AuthsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_authorities
    directory "authorities", "config/authorities"
  end

  def copy_qa_local
    copy_file "qa_local.rb", "config/initializers/qa_local.rb"
  end
end
