require_relative 'spec_helper'

describe ValidateUserInput do
  before :each do
    @user = AlphaGo.new
  end

  describe '#initialize' do
    it 'should return same passing parameter for main_menu' do
      @user.show_menu
      expect(@user.current_menu_hash).to eq(@user.fetch_menu(@user.current_menu_type))
      expect(ValidateUserInput.validate_selection(@user, "1")).to eq(1)
      expect(ValidateUserInput.validate_selection(@user, "2")).to eq(2)
      expect(ValidateUserInput.validate_selection(@user, "3")).to eq(3)
    end

    it 'should return same passing parameter for company_menu' do
      @user.first_question = false
      @user.show_menu
      expect(@user.current_menu_hash).to eq(@user.fetch_menu(@user.current_menu_type))
      expect(ValidateUserInput.validate_selection(@user, "1")).to eq(1)
      expect(ValidateUserInput.validate_selection(@user, "2")).to eq(2)
      expect(ValidateUserInput.validate_selection(@user, "3")).to eq(3)
      expect(ValidateUserInput.validate_selection(@user, "4")).to eq(4)
    end

    it 'should return same menu number equivalent for string parameter for main_menu' do
      @user.show_menu
      expect(@user.current_menu_hash).to eq(@user.fetch_menu(@user.current_menu_type))
      expect(ValidateUserInput.validate_selection(@user, "enter name")).to eq(1)
      expect(ValidateUserInput.validate_selection(@user, "work experience")).to eq(2)
      expect(ValidateUserInput.validate_selection(@user, "exit")).to eq(3)
    end

    it 'should return same menu number equivalent for string parameter for company_menu' do
      @user.first_question = false
      @user.show_menu
      expect(@user.current_menu_hash).to eq(@user.fetch_menu(@user.current_menu_type))
      expect(ValidateUserInput.validate_selection(@user, "job position")).to eq(1)
      expect(ValidateUserInput.validate_selection(@user, "company name")).to eq(2)
      expect(ValidateUserInput.validate_selection(@user, "back")).to eq(3)
      expect(ValidateUserInput.validate_selection(@user, "exit")).to eq(4)
    end
  end
end
