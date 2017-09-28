require "uri"
require "net/http"

module HttpRequest

  HOSTURL = '​ http://examplepg.com/transaction'


    #sending sample post request to the payment gatweway with parameter msg
	def self.pg_request(payload_to_pg)
 		uri = URI(HOSTURL)
		req = Net::HTTP::Post.new(uri)
		req.set_form_data('msg' => payload_to_pg)
		res = Net::HTTP.start(uri.hostname, uri.port) do |http|
		  http.request(req)
		end
		case res
		when Net::HTTPSuccess, Net::HTTPRedirection
			puts 'ok'
		else
		  puts res.body
		end
	end
end