class Card < ActiveRecord::Base

  def detectFace
    require "net/http"
    require "uri"

    api_key = "ef7cc32b6307446615b75b45feaf1998"
    # url = "http://eval.api.polestars.jp:8080/webapi/face.do"
    base_url = "http://eval.api.polestars.jp"
    uri = URI.parse(base_url+":8080"+"/webapi/face.do")
    response = nil
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Post.new(uri.path)
      request.set_content_type("application/x-www-form-urlencoded")
      form_data = {apiKey: api_key,
                   imageURL: 'http://garu-sol32.sakura.ne.jp/sblo_files/sara-shibanakata/image/sara-shibanakata-2014-03-31T19:39:03-1.jpeg'
                  }
      request.set_form_data(form_data, "&")
      response = http.request(request)
    end

    # require 'nokogiri'
    # xml_doc = Nokogiri::XML(response.body)
  end
end
