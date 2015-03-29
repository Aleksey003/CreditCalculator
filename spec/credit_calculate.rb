require_relative '../app.rb' # this load the file you are testing
require 'spec_helper.rb' # It will load the configuration you set in spec_helper.rb

describe 'make API call to loanpath' do	
  it "should load the home page" do
    visit '/'
    page.should have_content("Кредитный онлайн-калькулятор")
  end
end