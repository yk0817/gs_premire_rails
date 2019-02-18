require "#{Dir.pwd}/ruby_test/common"

BaseURL = "https://www.yahoo.co.jp/"

driver = Selenium::WebDriver.for(:chrome,
    url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub")
driver.get(BaseURL)
