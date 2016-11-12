require 'cgi'
require 'open-uri'
require 'json'

class KeyPhraseAnalyzer
  def initialize(sentence)
    @request_url = "http://jlp.yahooapis.jp/KeyphraseService/V1/extract"
    @api_key = ENV['KEY_PHRASE_API_KEY']
    @sentence = CGI.escape(sentence)
  end

  def analyze
    uri_encode = "#{@request_url}?appid=#{@api_key}&sentence=#{@sentence}&output=json"
    puts uri_encode
    res = open(uri_encode)
    code,message = res.status

    if code == '200'
      ret = res.read
      JSON.parse(ret)
    else
      puts "[ERROR] #{code}:#{message}"
    end
  end
end

=begin
sentence = "鳥取県で震度6弱"
analyzer = KeyPhraseAnalyzer.new(sentence)

ret = analyzer.analyze
puts ret
=end