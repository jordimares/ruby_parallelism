require 'net/http'

threads = []

300.times do 
	t = Thread.new do 
		10.times do  |i|
			puts "This is a thread #{Thread.current.object_id} - #{i}"
			url = URI.parse('http://www.simplybusiness.co.uk')
			req = Net::HTTP::Get.new(url.to_s)
			res = Net::HTTP.start(url.host, url.port) {|http|
			  http.request(req)
			}
			puts res.body.length
			sleep rand(0.5..2)
		end
		puts "This is a thread #{Thread.current.object_id} - Done"
	end

	threads << t
end

threads.each do |t|
	t.join
end

puts threads.count
puts "All done"