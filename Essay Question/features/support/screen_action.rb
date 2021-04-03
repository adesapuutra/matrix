def screenshot(name)
    $browser.save_screenshot("ss/#{name}.png")
    embed("ss/#{name}.png","image/png")
end

def scroll_up()
    $browser.execute_script('window.scrollTo(0, 0)')
end

def scroll_down()
    $browser.execute_script('window.scrollTo(0, document.body.scrollHeight)')
end

def maximize_browser()
    $browser.manage.window.maximize
end

def minimize_browser()
    $browser.manage.window.minimize
end

def open_url(url)
    $browser.navigate.to url
end
