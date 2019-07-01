module WaitForAjax extend Capybara::DSL
  def self.as
    Timeout.timeout(Capybara.default_max_wait_time) do
      puts page.evaluate_script('jQuery.active')
      loop until page.evaluate_script('jQuery.active')
    end
  end
end