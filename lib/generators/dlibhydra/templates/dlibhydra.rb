# load dlibhydra config
DLIBHYDRA = YAML.load_file("#{Rails.root.to_s}/config/dlibhydra.yml")[Rails.env]
