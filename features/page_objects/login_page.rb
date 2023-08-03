# page_objects/login_page.rb
class LoginPage
    def initialize(driver)
      @driver = driver
    end
  
    def navigate_to_login_page
      @driver.get('https://opensource-demo.orangehrmlive.com/web/index.php/auth/login')
      sleep(5) 
    end
  
    def enter_username(username)
      @driver.find_element(name: 'username').send_keys(username)
    end
  
    def enter_password(password)
      @driver.find_element(name: 'password').send_keys(password)
    end
  
    def click_login_button
      @driver.find_element(xpath: '//*[@type="submit"]').click
    end
  end
    