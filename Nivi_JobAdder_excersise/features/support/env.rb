require 'rubygems'
require 'watir'
require 'pry'

#hooks to launch the browser
Before do |scenario|
  browser = Watir::Browser.new :chrome
  $browser = browser
  $browser.driver.manage.window.maximize
end

After do |scenario|
  $browser.close
end


$report_path = 'html_reports'
AfterStep do  |scenario|
  sleep(0.5)

  file = Tempfile.new(["screenshot_", ".png"], $report_path)
  screenshot = file.path
  file.close(true)
  $browser.driver.save_screenshot(screenshot)
  embed "#{screenshot}","image/png"
end