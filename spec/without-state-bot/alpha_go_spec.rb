require_relative 'spec_helper'

describe AlphaGo do
  before :each do
    @user = AlphaGo.new
  end

  describe '#initialize' do
    it 'should have true vale in first_question' do
      expect(@user.first_question).to eq(true)
    end

    it 'should have first_name nil' do
      expect(@user.first_name).to eq(nil)
    end

    it 'should have last_name nil' do
      expect(@user.last_name).to eq(nil)
    end

    it 'should have position nil' do
      expect(@user.position).to eq(nil)
    end

    it 'should have company nil' do
      expect(@user.company).to eq(nil)
    end

    it 'should have current_menu_type nil' do
      expect(@user.current_menu_type).to eq(nil)
    end

    it 'should have current_menu_hash nil' do
      expect(@user.current_menu_hash).to eq(nil)
    end

    it 'should have previous_menu nil' do
      expect(@user.previous_menu).to eq(nil)
    end

    it 'should have full_name not provided' do
      expect(@user.full_name).to eq(RenderMenu.not_provided.to_s + ' ' +
      RenderMenu.not_provided.to_s + ' ' + RenderMenu.checkmark)
    end

    it 'should have work_details not provided' do
      expect(@user.work_details).to eq('Working as ' +
      RenderMenu.not_provided.to_s + ' in ' +
      RenderMenu.not_provided.to_s + ' ' + RenderMenu.checkmark)
    end

    it 'should have current_menu_hash as main_menu hash' do
      @user.show_menu
      expect(@user.current_menu_hash).to eq(@user.fetch_menu(@user.current_menu_type))
    end

    it 'should have current_menu_type main_menu' do
      @user.show_menu
      expect(@user.current_menu_type).to eq('main_menu')
    end

    it 'should have current_menu_hash as company_menu_hash hash' do
      @user.first_question = false
      @user.show_menu
      expect(@user.current_menu_hash).to eq(@user.fetch_menu(@user.current_menu_type))
    end

    it 'should have current_menu_type company_menu' do
      @user.first_question = false
      @user.show_menu
      expect(@user.current_menu_type).to eq('company_menu')
    end
  end
end
