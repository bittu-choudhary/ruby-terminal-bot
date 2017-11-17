require_relative '../../without-state-bot/alpha_go'
require_relative '../../without-state-bot/process_user_input'
require_relative '../../without-state-bot/render_menu'
require_relative '../../without-state-bot/validate_user_input'
require 'yaml'
require 'byebug'
RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    # Redirect stderr and stdout
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end
