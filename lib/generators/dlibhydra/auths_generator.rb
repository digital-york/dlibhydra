class Dlibhydra::AuthsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_authorities
    directory "authorities", "config/authorities"
  end

  def copy_qa_local
    file_path = 'config/initializers/qa_local.rb'
    unless File.exist?(file_path)
      copy_file "qa_local.rb", "config/initializers/qa_local.rb"
    end
    file_content = File.read(file_path)
    ::Terms.constants.each do |term|
      t = term.to_s
      term_sting = "Qa::Authorities::Local.register_subauthority('#{t.gsub('Terms', '').humanize}s', 'Dlibhydra::Terms::#{t}')"
      unless file_content.include?
        inject_into_file file_path, after: '# include Terms' do
          term_sting
        end
      end
    end
  end
end
