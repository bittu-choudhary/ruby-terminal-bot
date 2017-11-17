require_relative 'alpha_go'
require 'lexeme'
# Provides menu to user
module LexicalAnalyzer
  class << self
    def lexer
      Lexeme.define do
        token :NAME       => /^entername$/
        token :WORK     => /^workexperience$/
        token :POSITION    => /^currentjobposition$/
        token :COMPANY    => /^currentcompany$/
        token :BACK      => /^back$/
        token :EXIT   => /^exit$/
      end
    end

    def analysis(user,string)
      lexer.analyze do
        begin
          from_string string.delete(' ').downcase
        rescue
          puts "Error -> Undefined selection. Please select correct option\n"
          user.converse
        end
      end
    end
  end
end
