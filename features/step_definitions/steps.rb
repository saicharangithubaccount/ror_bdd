require 'selenium-webdriver'
require 'webdrivers'
require_relative '../page_objects/login_page'

  Given("the user navigates to login") do
     # options = Selenium::WebDriver::Chrome::Options.new
     options = Selenium::WebDriver::Firefox::Options.new
     @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub',options: options
    #  @driver = Selenium::WebDriver.for :firefox
     @driver.manage.window.maximize
     @login_page = LoginPage.new(@driver)
  end
  
  When("the user enters valid credentials") do
    @login_page.navigate_to_login_page
    @login_page.enter_username('Admin')
    @login_page.enter_password('admin123')
  end
  
  Then("the user should able to login") do
    screenshot
    @login_page.click_login_button
    @driver.quit
  end

  def screenshot
    screenshot = "screenshot.png"
    @driver.save_screenshot(screenshot)
    attach(screenshot, 'image/png')
  end