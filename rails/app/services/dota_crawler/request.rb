module DotaCrawler
  
class Request
    attr_accessor :url, :method, :params, :body

    def initialize(url, method, params, body)
      self.url, self.method, self.params, self.body = url, method, params, body
    end

    def exec
      request = Typhoeus::Request.new(
        @url,
        method:   @method,
        body:     @body,  # string
        params:   @params # hash
      )
      request.run   
    end
  end
end