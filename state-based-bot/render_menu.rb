require_relative 'alpha_go'
# Provides menu to user
module RenderMenu
  class << self
    def not_provided
      '<not-provided>'
    end

    def checkmark
      checkmark = "\u2713"
      checkmark.encode('utf-8')
    end

    def main_menu_hash(user)
      {
        name: 'main_menu',
        options: {
          1 => user.first_name.nil? || user.last_name.nil? ? 'Enter Name' : user.full_name,
          2 => user.position.nil? || user.company.nil? ? 'Enter Work Details' : user.work_details,
          3 => 'Exit'
        },
        default: true
      }
    end

    def company_menu_hash(user)
      {
        name: 'company_menu',
        options: {
          1 => user.position.nil? ? 'Current Job Position' : user.position + ' ' + checkmark,
          2 => user.company.nil? ? 'Current Company Name' : user.company + ' ' + checkmark,
          3 => 'Back to previous menu',
          4 => 'Exit'
        },
        default: false
      }
    end

    def menu(user)
      [
        main_menu_hash(user),
        company_menu_hash(user)
      ]
    end
  end
end
