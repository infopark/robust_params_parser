class RobustParamsParser < ActionDispatch::ParamsParser
  DecodeError = Class.new(MultiJson::DecodeError)

  def initialize(app, parsers={})
    super(app, parsers)
  end

  def call(env)
    super(env)
  rescue RobustParamsParser::DecodeError
    [400, {}, ['Bad Request']]
  end

  private

  def parse_formatted_parameters(env)
    super(env)
  rescue MultiJson::DecodeError
    raise RobustParamsParser::DecodeError
  end
end
