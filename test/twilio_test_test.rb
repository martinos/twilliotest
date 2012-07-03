# encoding: utf-8

require './lib/twilio_test'
require 'test/unit'
require 'rack/test'
require './test/test_helper'

ENV['RACK_ENV'] = 'test'

class TwilioTestTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TwilioTest
  end

  def test_call_method
    post 'call'
    assert last_response.ok?
    expected = <<EOF
<Response>
  <Say voice="woman" language="fr">Bonjour les amis!</Say>
  <Gather action="/main_menu_selection" numDigits="1">
    <Say voice="woman" language="fr">Si vous voulez l'heure en temps local appuyez sur 1.</Say>
    <Say voice="woman" language="fr">Si vous voulez l'heure universelle appuyez sur 2. </Say>
  </Gather>
</Response>
EOF
    assert_equal expected, last_response.body
    Time.stubs(:now).returns(Time.local(2012,1,1,22,30))
    post 'main_menu_selection', :Digits => '1'
    assert last_response.ok?
    expected = <<EOF
<Response>
  <Say voice="man" language="fr">Il est 22 heures 30</Say>
</Response>
EOF
    assert_equal expected, last_response.body
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end
