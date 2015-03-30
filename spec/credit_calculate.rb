require_relative '../app.rb' 
require 'spec_helper.rb'

describe 'test form validations' do	
  

  it "should require a term " do 
    visit 'http://0.0.0.0:4567'
    fill_in 'percent', with: "8"
    fill_in 'credit', with: "100000"
    page.execute_script("$('form').submit()")
    expect(page).to have_content("Вы ввели не все данные ")
  end

  it "should require a percent" do 
    visit 'http://0.0.0.0:4567'
    fill_in 'term', with: "12"
    fill_in 'credit', with: "100000"
    page.execute_script("$('form').submit()")
    expect(page).to have_content("Вы ввели не все данные ")
  end

  it "should require a credit" do 
    visit 'http://0.0.0.0:4567'
    fill_in 'percent', with: "8"
    fill_in 'term', with: "12"
    page.execute_script("$('form').submit()")
    expect(page).to have_content("Вы ввели не все данные ")
  end
end

describe '1000 at interest 8 for 12 months'do
  it "usual method sum should be 104333.34 " do
    visit 'http://0.0.0.0:4567'
    fill_in 'percent', with: "8"
    fill_in 'term', with: "12"
    fill_in 'credit', with: "100000"
    page.execute_script("$('form').submit()")
    expect(find(:xpath, '//table//tr[last()]//td[4]').text).to have_content '104333.34'
  end

  it "equal method sum should be 104333.34 " do
    visit 'http://0.0.0.0:4567'
    fill_in 'percent', with: "8"
    fill_in 'term', with: "12"
    fill_in 'credit', with: "100000"
    find(:css, '[name=pay_off][value=equal]').set(true)
    page.execute_script("$('form').submit()")
    expect(find(:xpath, '//table//tr[last()]//td[4]').text).to have_content '104386.11'
  end

end
