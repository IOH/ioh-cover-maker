#
#  @editor  arfullight
#  @date    2016/3/23
#  @info    format timestamps when parse to json
#
class ActiveSupport::TimeWithZone
  def as_json(options = {})
      strftime('%Y-%m-%d %H:%M:%S')
  end
end