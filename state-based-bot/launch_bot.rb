require_relative 'alpha_go'
require 'rubygems'
require 'state_machine'
require 'byebug'

class CommandLineBot
  include AlphaGo
  state_machine :state, initial: :menu do

    event :restart do
      transition all => :menu
    end
    event :wait_for_input do
      transition :menu => :awaiting_input
    end

    event :validate_input do
      transition :awaiting_input => :validating_input
    end

    event :process_input do
      transition :validating_input => :processing_input
    end

    event :exit_converse do
      transition all => :complete
    end

    state :menu do
      def display
        show_menu
        self.wait_for_input
        self.get_input
      end
    end

    state :awaiting_input do
      def get_input
        self.user_selection = gets.chomp
        self.validate_input
        self.validate
      end
    end

    state :validating_input do
      def validate
        self.user_selection = ValidateUserInput.validate_selection(self, user_selection)
        if self.user_selection
          self.process_input
          self.process
        else
          self.restart
          self.display
        end
      end
    end

    state :processing_input do
      def process
        ProcessUserInput.process_selection(self, user_selection)
      end
    end

    state :complete do
      def render
        render_details
      end
    end
  end
end
user = CommandLineBot.new
user.display
