require 'json'

class Mention
  def initialize(json)
    @json = JSON.parse(json)
  end

  def body
    return @json['webhook_event']['body']
  end
end
