require_relative '../support/screen_action.rb'

Selenium::WebDriver::Chrome.driver_path='C:\Users\Ryan Ade Saputra\Desktop\tes\chromedriver_win32\chromedriver.exe'
driver=Selenium::WebDriver.for :chrome

Given("User open Bukalapak Website") do
    maximize_browser()
    open_url("https://www.bukalapak.com")
    sleep(2)
    screenshot("homepage screen")
  end
  
  Then("User search {string}") do |keyword|
    search(keyword)
    screenshot("search success")
    sleep(2)
  end