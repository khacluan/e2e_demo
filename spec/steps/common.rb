step 'access :site' do |site|
  Capybara.app_host = site
end

step 'visit :path' do |path|
  visit path
end

step 'response code is :code' do |code|
  expect(page.status_code).to eq(code.to_i)
end

step 'response includes :string' do |string|
  expect(page).to have_content(string)
end

step 'response includes :input_type input with name :input_name' do |input_type, input_name|
  expect(page).to have_selector("input[type='#{input_type}'][name='#{input_name}']")
end

step 'response includes select tag :name with option :option selected' do |name, option|
  expect(page).to have_selector("select[name='#{name}'] > option[selected='selected'][value='#{option}']")
end

step 'response includes checkbox :name input with :value checked' do |name, value|
  expect(page).to have_selector("input[name='#{name}'][type='checkbox'][checked='checked'][value='#{value}']")
end

step 'response includes radio :name input with :value checked' do |name, value|
  expect(page).to have_selector("input[name='#{name}'][type='radio'][checked='checked'][value='#{value}']")
end

step 'response includes text input tag :name with :value filled in' do |name, value|
  expect(page).to have_selector("input[name='#{name}'][type='text'][value='#{value}']")
end


step 'title includes :string' do |string|
  expect(page.title).to have_content(string)
end

step 'h1 includes :string' do |string|
  expect(page.find('h1')).to have_content(string)
end

step 'h2 includes :string' do |string|
  expect(page.find('h2')).to have_content(string)
end

step 'have link :link' do |link|
  page.should have_selector("a[href='#{link}']")
end

step 'not have link :link' do |link|
  page.should_not have_selector('a[href="'+ link +'"]')
end

step 'not find link :link' do |link|
  expect(find("a[href='#{link}']", visible: false)).to_not be_visible
end

step 'not have link :link' do |link|
  page.should_not have_selector('a[href="'+ link +'"]')
end

step 'check cookies :cookies' do |cookies|
  expect(page.driver.cookies["history"].value).to eq(cookies.to_s)
end

step 'click link :link' do |link|
  first(:xpath, "//a[@href='" + link + "']").click
end

step 'fill in :field_name with :value' do |field_name, value|
  fill_in field_name, with: value, :match => :first
end

step 'click button by class :class_name' do |class_name|
  first(:xpath, '//input[@class="' + class_name + '"]').click
end

step 'click button by id :id_name' do |id_name|
  first(:xpath, '//input[@id="' + id_name + '"]').click
end

step 'click input button by text :text' do |text|
  first(:xpath, '//input[@value="' + text + '"]').click
end

step 'not have input button with value :value' do |value|
  expect(page).not_to have_selector(:xpath, '//input[@value="' + value + '"]')
end

step 'checked with id :id' do |id|
  find("##{id}").set(true)
end

step 'choose with id :id' do |id|
  choose("#{id}")
end

step 'checked with name :name and value :value' do |name, value|
  find("input[name='#{name}'][value='#{value}']").set(true)
end

step 'selected :field with :value' do |field, value|
  select(value, from: field)
end

step 'fill in email' do
  fill_in 'user[email]', with: "abc#{Time.now.to_i}@gmail.com"
end

step 'log in with email :email and password :password' do |email, password|
  visit new_user_session_path
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'ログインする'
end

step 'use smartphone' do
  page.driver.headers = { "User-Agent" => "Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53" }
end

step 'have :tag with id :id' do |tag, id|
  page.should have_selector("#{tag}##{id}")
end

step 'have :tag with class :klass' do |tag, klass|
  page.should have_selector("#{tag}.#{klass}")
end

step ':tag with id :id is enabled' do |tag, id|
  expect(page).not_to have_selector("#{tag}##{id}[disabled='disabled'], #{tag}##{id}[disabled='true']")
end

step ':tag with id :id is disabled' do |tag, id|
  expect(page).to have_selector("#{tag}##{id}[disabled='disabled'], #{tag}##{id}[disabled='true']")
end

step 'click on link with text :text' do |text|
  page.driver.browser.switch_to_window(page.driver.browser.window_handles.last)
  sleep 5
  first(:xpath, "//a[./text()='#{text}']").click
end

step 'trigger event click on link with id :id' do |id|
  first(:xpath, '//a[@id="' + id + '"]').trigger('click')
  sleep 10
end


step 'current url is :url' do |url|
  expect("#{URI.parse(current_url).request_uri}").to eq url
end

step 'current url is :url' do |url|
  expect("#{URI.parse(current_url).request_uri}").to eq url
end

step 'current url is :url' do |url|
  expect("#{URI.parse(current_url).request_uri}").to eq url
end

step 'current host is :host' do |host|
  expect("#{URI.parse(current_url).host}").to eq host
end

step 'current host is capybara app host' do
  expect(current_host).to eq Capybara.app_host
end

step 'save screenshot' do
  sleep 5
  page.save_screenshot("#{Rails.root}/tmp/capybara/capybara-#{Time.now.to_i}.png", :full => true)
end

step 'upload avatar to :locator from :path' do |locator, path|
  attach_file(locator, path)
end
