describe "Contacts" do
  it "delivers a valid message" do
    visit new_contact_path
    fill_in 'Navn', :with => 'Test Testesen'
    fill_in 'Email', :with => 'test@test.dk'
    fill_in 'Besked', :with => 'Lorem ipsum blabla'

    click_button 'Send'

    page.body.should have_content('Din email blev sendt, vi kontakter dig.')

    last_email.to.should include('znowm4n@gmail.com')
    last_email.from.should include('test@test.dk')

  end

end