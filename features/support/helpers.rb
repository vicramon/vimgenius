def wait_for_ajax
  Timeout.timeout(Capybara.default_wait_time) do
    page.evaluate_script "window.jQuery ? jQuery.active == 0 : true"
  end
end
