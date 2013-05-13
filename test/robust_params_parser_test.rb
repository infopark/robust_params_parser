require 'multi_json'
require 'rack/test'
require 'rails/all'
require 'test/unit'

require File.expand_path('../../lib/robust_params_parser', __FILE__)

class RobustParamsParserTest < Test::Unit::TestCase
  include Rack::Test::Methods

  class MyApp
    def call(env)
      if env['action_dispatch.request.request_parameters']['fail']
        raise MultiJson::DecodeError
      else
        [200, {}, [env['action_dispatch.request.request_parameters']['foo']]]
      end
    end
  end

  def my_app
    MyApp.new
  end

  def app
    RobustParamsParser.new(my_app, {Mime::JSON => :json})
  end

  def test_delegates_to_app_on_success
    post '/', MultiJson.encode({'foo' => 'bar'}), {'CONTENT_TYPE' => 'application/json'}
    assert last_response.ok?
    assert_equal last_response.body, 'bar'
  end

  def test_responds_with_400_on_parse_error
    post '/', '---boom!', {'CONTENT_TYPE' => 'application/json'}
    assert last_response.bad_request?
  end

  def test_rescues_only_param_parsing_errors
    assert_raise MultiJson::DecodeError do
      post '/', MultiJson.encode({'fail' => true}), {'CONTENT_TYPE' => 'application/json'}
    end
  end
end
