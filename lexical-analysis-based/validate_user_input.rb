require_relative 'alpha_go'
require_relative 'lexical_analyzer'
# validates input entered by user
module ValidateUserInput
  class << self
    def match_key(user, selection)
      if user.current_menu_hash.keys.include?(selection.to_i)
        selection.to_i
      else
        puts "Error -> Please select correct menu option\n"
        user.converse
      end
    end

    def match_string_value(user, selection)
      user.current_menu_hash.values.each_with_index do |menu_title, index|
        break user.current_menu_hash.keys[index] if
         selection.casecmp(menu_title.downcase).zero?
      end
    end

    def validate_selection(user, selection)
      if selection.scan(/\D/).empty?
        match_key(user, selection)
      else
        LexicalAnalyzer.analysis(user, selection)
        match_string_value(user, selection)
      end
    end
  end
end
