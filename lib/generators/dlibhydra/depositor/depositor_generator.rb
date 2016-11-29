class Dlibhydra::DepositorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../../templates', __FILE__)

  def inject_into_depositor
    init_path = 'config/initializer/dlibhydra.rb'
    file_path = 'config/dlibhydra.yml'
    unless File.exist?(file_path)
      copy_file 'dlibhydra.yml', file_path
      copy_file 'dlibhydra.rb', init_path
    end
    # find and replace the depositor value with the supplied value
    gsub_file file_path, /depositor:\s\S{2,}\n/, "depositor: '#{file_name}'\n"
  end


end
