require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.app_host = "http://website"
Capybara.run_server = false
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
  :browser => :remote,
  :url => "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
  :desired_capabilities => Selenium::Webdriver::Remote::Capabilities.chrome(
    "chromeOptions" => { "args" => [
      '--no-default-browser-check',
      '--disable-dev-shm']}
    )
  )
end
Capybara.default_driver = :selenium
describe "Example page render unit tests" do
  it "Shows the Explore California logo" do
    visit('/')
    expect(page.has_selector? 'a.logo').to be true
  end
end
