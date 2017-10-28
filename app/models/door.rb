class Door
  require 'selenium-webdriver'

  def initialize (myforum, myusername, mypassword)
    @forum = myforum
    @username = myusername
    @password = mypassword
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to @forum #'http://vinforum.ru/'
  end

  def sign_in
    @driver.find_element(:name, 'user')
        .send_keys(@username)
    @driver.find_element(:name, 'passwrd')
        .send_keys(@password)
    @driver.find_element(:css, '#guest_form .button_submit')
        .click
  end

  def messages_count
    messages = @driver.find_element(:css, '#button_pm span.firstlevel')
    indx = messages.text.index('[') + 1
    count = messages.text[indx..-1].to_i
    @driver.quit
    count
  end

  def open_messages
    @driver.find_element(:id, 'button_pm').find_element(:css, 'span.firstlevel').click
    @driver.find_element(:link_text, 'Входящие').click
  end


end
