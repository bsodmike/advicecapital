Panda.configure((ENV['PANDASTREAM_URL'] ||
YAML::load_file(File.join(File.dirname(__FILE__),"..", "panda.yml"))[RAILS_ENV]))