def search_post_id(postId)
    @path = ENVIRONMENT['PATH']['api_path']
    @service = ENVIRONMENT['GET_SERVICES']['search_post_api']
    @url = "#{@path}#{@service}/#{postId}"
    @last_response = ServiceApi.get(@url)
end	

def create_body(title, body, userId)
   @body = {
       "title" => "#{title}",
       "body" => "#{body}",
       "userId" => "#{userId}",
   }.to_json
end

def create_post
   @path = ENVIRONMENT['PATH']['api_path']
   @service = ENVIRONMENT['GET_SERVICES']['search_post_api']
   @url = "#{@path}#{@service}"
   @last_response = ServiceApi.post(@url, :body => @body)
   puts "Response code: #{@last_response.code}"
   @bodyCreated = {
        "title" => "#{@last_response["title"]}",
        "body" => "#{@last_response["body"]}",
        "userId" => "#{@last_response["userId"]}",
    }.to_json
   puts "New Post ID = #{@bodyCreated}"

   expect(@bodyCreated).to eq @body   
end

def search_debug_url
    puts @url
end

def check_integer?(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? "false" : "true"
end

def check_string?(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? "true" : "false"
end

def data_type_integer(obj) 
    expect(obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/)).to_not eq nil
end

def data_type_string(obj) 
    expect(obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/)).to eq nil
end

def response_code(responseCode)
    @last_response.code.to_s.should == responseCode
    @last_response.bad_gateway? != "false"
    @last_response.success? == "true"
end

class ServiceApi
	include HTTParty
	base_uri ENVIRONMENT['PATH']['api_path']
	format :json
	headers 'Content-Type' => 'application/json'
	basic_auth AUTH['user'], AUTH['pass']
end

