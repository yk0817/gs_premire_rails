require "#{Dir.pwd}/ruby_test/common"
# 環境変数読み込み
Dotenv.load

BaseURL = "https://www.rakuten-sec.co.jp/ITS/V_ACT_Login.html"
driver = Selenium::WebDriver.for(:chrome,
    url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub")
driver.get(BaseURL)

driver.find_element(id: "form-login-id").send_keys(ENV["ID"])
driver.find_element(id: "form-login-pass").send_keys(ENV["PASS"])
driver.find_element(id: "login-btn").click()
# 若干描画が遅いとき
# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# wait.until { driver.find_element(css: "div #nav-main-menu") }
driver.find_element(css: "#gmenu_ass_settlement > a").click()
driver.find_element(class: "icon-link-round").click()
p driver.find_element(id: "err_msg").text
