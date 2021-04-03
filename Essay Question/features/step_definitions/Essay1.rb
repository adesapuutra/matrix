require_relative '../support/screen_action.rb'

Given("I search the id {string}") do | id |
    @response = search_post_id(id)
end

Then("I should get response {string}") do | responseCode |
    response_code(responseCode)
end

Then("I check whether the {string} is Integer") do | attribute |
    parsed_response = JSON.parse(@response.body)
    log check_integer?(parsed_response["#{attribute}"])
    data_type_integer(parsed_response["#{attribute}"]) 
end

Then("I check whether the {string} is String") do | attribute |
    parsed_response = JSON.parse(@response.body)
    log check_string?(parsed_response["#{attribute}"])
    data_type_string(parsed_response["#{attribute}"]) 
end


Given("I send new post for create with title {string}, body {string} and userId {string}") do |title, body, userId|
    create_body(title, body, userId)
    @response = create_post
    Kernel.puts "Note: the resource will not be really *created* on the server but it will be faked as if"
end

