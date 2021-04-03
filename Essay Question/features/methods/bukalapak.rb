$search = "v-omnisearch__input"

def search(keyword)
    $browser.find_element(:id, $search).send_keys(keyword, :enter)
end