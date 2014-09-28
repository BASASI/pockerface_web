class Card < ActiveRecord::Base
  belongs_to :user
  before_create :set_xml_doc

  mount_uploader :image_url, FaceUploader

  def set_xml_doc
    require 'rexml/document'
    response = detectFace
    self.xml_doc = response.body

    doc = REXML::Document.new self.xml_doc
    face_info = doc.elements['results/faceRecognition/detectionFaceInfo']
    self.offense = face_info.elements['smileJudge/smileLevel'].text.to_i
    self.defense = face_info.elements['enjoyJudge/doyaLevel'].text.to_i
    # trouble = face_info.elements['enjoyJudge/troubleLevel'].text.to_i
  end

  def detectFace
    require "net/http"
    require "uri"

    api_key = "ef7cc32b6307446615b75b45feaf1998"
    base_url = "http://eval.api.polestars.jp"
    uri = URI.parse(base_url+":8080"+"/webapi/face.do")
    response = nil
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Post.new(uri.path)
      request.set_content_type("application/x-www-form-urlencoded")
      form_data = {apiKey: api_key,
                   imageURL: 'http://garu-sol32.sakura.ne.jp/sblo_files/sara-shibanakata/image/sara-shibanakata-2014-03-31T19:39:03-1.jpeg',
                   enjoyJudge: 1
                  }
      request.set_form_data(form_data, "&")
      response = http.request(request)
    end
    response
  end

  def battle
  end
end
