require 'mechanize'

a = Mechanize.new { |agent|
  agent.follow_meta_refresh = true
}

initial = 'http://virtua.uel.br:8000/cgi-bin/gw/chameleon?sessionid=2013052212400130148&skin=default&lng=pt&inst=consortium&timedout=1'

a.get(initial) do |home_page|
  after_login = home_page.form_with(:name => 'patronsearch') do |f|
    f.patronid = '12005601401327'
    f.patronpassword = '7635'
  end.submit
  
  after_login.form_with(:name => 'patronselect') do |f|
    f.checkbox_with(:name => 'itembarcode').check
  end.submit
  
  puts 'ok!'
end