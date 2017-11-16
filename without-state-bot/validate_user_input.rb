require_relative 'alpha_go'
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
        title_regex = /#{menu_title.downcase.split(" ").join("|")}/
        break user.current_menu_hash.keys[index] if
         title_regex.match?(selection.downcase)
        if (index + 1) == user.current_menu_hash.values.length
          puts "Error -> Please select correct menu option\n"
          user.converse
        end
      end
    end

    def validate_selection(user, selection)
      if selection.scan(/\D/).empty?
        match_key(user, selection)
      else
        match_string_value(user, selection)
      end
    end
  end
end
