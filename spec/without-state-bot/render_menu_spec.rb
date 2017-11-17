require_relative 'spec_helper'

describe RenderMenu do

  before :each do
    @user = AlphaGo.new
  end

  describe '#initialize' do
    it 'should return <not-provided>' do
      expect(RenderMenu.not_provided).to eq('<not-provided>')
    end

    it 'should return main menu without user data' do
      expect(RenderMenu.main_menu_hash(@user)).to eq(main_menu_hash_without_user_data)
    end

    it 'should return company menu without user data' do
      @user.first_question = false
      expect(RenderMenu.company_menu_hash(@user)).to eq(company_menu_hash_without_user_data)
    end

    it 'should return menu without user data' do
      expect(RenderMenu.menu(@user)).to eq(menu_hash_without_user_data)
    end
  end

  def main_menu_hash_without_user_data
    {
      name: 'main_menu',
      options: {
        1 => 'Enter Name',
        2 => 'Enter Work Details',
        3 => 'Exit'
      },
      default: true
    }
  end

  def company_menu_hash_without_user_data
    {
      name: 'company_menu',
      options: {
        1 => 'Current Job Position',
        2 => 'Current Company Name',
        3 => 'Back to previous menu',
        4 => 'Exit'
      },
      default: false
    }
  end

  def menu_hash_without_user_data
    [
      main_menu_hash_without_user_data,
      company_menu_hash_without_user_data
    ]
  end
end
