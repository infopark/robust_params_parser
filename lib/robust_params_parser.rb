class RobustParamsParser < ActionDispatch::ParamsParser
  def initialize(app, parsers={})
    super(app, parsers)
  end

  def call(env)
    super(env)
  rescue MultiJson::DecodeError
    [400, {}, ['Bad Request']]
  end
end
