require_relative 'alpha_go'
# process input entered by user
module ProcessUserInput
  class << self
    def process_main_menu(user, user_selection)
      case user_selection
      when 1
        user.first_name = user.feed_data('first')
        user.last_name = user.feed_data('last')
        user.first_question = true
        user.restart
        user.display
      when 2
        user.first_question = false
        user.restart
        user.display
      when 3
        user.exit_converse
        user.render
      end
    end

    def process_company_menu(user, user_selection)
      case user_selection
      when 1
        user.position = user.feed_data('position')
        user.restart
        user.display
      when 2
        user.company = user.feed_data('company')
        user.restart
        user.display
      when 3
        user.first_question = true
        user.restart
        user.display
      when 4
        user.exit_converse
        user.render
      end
    end

    def process_selection(user, user_selection)
      if user.current_menu_type == 'main_menu'
        process_main_menu(user, user_selection)
      else
        process_company_menu(user, user_selection)
      end
    end
  end
end
