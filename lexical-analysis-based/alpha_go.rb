require 'rubygems'
require 'state_machine'
require 'byebug'
require_relative 'render_menu.rb'
require_relative 'validate_user_input'
require_relative 'process_user_input'
# Handles conversation with user
class AlphaGo
  include RenderMenu
  attr_accessor :first_name, :last_name, :position, :company,
                :current_menu_type, :current_menu_hash, :first_question,
                :previous_menu

  def initialize
    self.first_question = true
  end

  def full_name
    (first_name ? first_name : RenderMenu.not_provided).to_s + ' ' +
      (last_name ? last_name : RenderMenu.not_provided).to_s + ' ' +
      RenderMenu.checkmark
  end

  def work_details
    details = 'Working as ' +
              (position ? position : RenderMenu.not_provided).to_s + ' in ' +
              (company ? company : RenderMenu.not_provided).to_s + ' ' +
              RenderMenu.checkmark
    details
  end

  def fetch_menu(type)
    menu_object =
      RenderMenu.menu(self).select { |menu_type| menu_type[:name] == type }
    menu_object.first[:options].each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def show_menu
    puts "\nPlease select item from following Menu.
Type serial No. or menu title e.g. \"enter name\"\n"
    self.current_menu_type = first_question ? 'main_menu' : 'company_menu'
    self.current_menu_hash = fetch_menu(current_menu_type)
  end

  def feed_data(type)
    puts "Enter #{type.capitalize} Name"
    gets.chomp
  end

  def render_details
    puts "\n\nUser Details"
    puts full_name
    puts work_details
  end

  def converse
    show_menu
    user_selection = gets.chomp
    user_selection = ValidateUserInput.validate_selection(self, user_selection)
    ProcessUserInput.process_selection(self, user_selection)
  end
end
