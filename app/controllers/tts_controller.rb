class TrainerController < ApplicationController

  before_filter :authenticate_user!
  before_filter :required_trainer
  
  def convert_and_save
    uri = URI.parse()
    form_data = {"speech"=>"testing", "voice"=>"nitech_us_rms_arctic_hts", "volume_scale"=>5, "make_audio"=>"Convert Text to Speech"}
     response = Net::HTTP.post_form(uri, form_data)
     doc = Nokogiri::HTML(response.body)
     x = doc.css('div').select {|x| x.attributes.map {|y| y.last.value}.first == "downloadlink"}
     attri =  x.first.children.select {|x|  x.is_a?(Nokogiri::XML::Element) && x.name == "a" }
     mp3_name = attri.first.attributes["href"].value
     puts "MP3NAME #{mp3_name}"
     
     mp3_uri = URI("http://www.text2speech.org/#{mp3_name}")
     response = Net::HTTP.get_response(mp3_uri)
     if response.is_a?(Net::HTTPSuccess)
       tempfile = Tempfile.new('audio.mp3')
       puts "TEMPFOLE PATH #{tempfile.path}"
       File.open(tempfile.path,'wb') do |f|
         f.write response.body
       end
     end
  end
end
