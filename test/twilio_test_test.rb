# encoding: utf-8

require './lib/twilio_test'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TwilioTest
  end

  def test_call_method
    post '/call'
    expected = <<EOF
<Response>
  <Say voice="woman" language="fr">Bonjour les amis!</Say>
  <Gather action="/main_menu_selection" numDigits="1">
    <Say voice="woman" language="fr">Si vous êtes Stéphane Hamel appuyez sur 1.</Say>
    <Say voice="woman" language="fr">Si vous êtes Étienne Savard sur 2. </Say>
  </Gather>
</Response>
EOF
    assert_equal expected, last_response.body
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end
