require 'mechanize'

class LivroRenovator
  
  def initialize(cod, pass)
    @initial = "http://virtua.uel.br:8000/cgi-bin/gw/chameleon?" +
               "sessionid=2013052212400130148&skin=default&lng=pt&inst=consortium&timedout=1"
    @cod = cod
    @pass = pass
    @agent = Mechanize.new { |agent| agent.follow_meta_refresh = true }
  end
  
  def renew_all!
    @agent.get(@initial) do |home_page|
      after_login = home_page.form_with(:name => 'patronsearch') do |f|
        f.patronid = @cod
        f.patronpassword = @pass
      end.submit
      
      after_login.form_with(:name => 'patronselect') do |f|
        f.checkbox_with(:name => 'itembarcode').check
      end.submit
    end
  end
  
  def renewed?
    true
  end
end