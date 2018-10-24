require 'json'

class Mention
  def initialize(json)
    @json = JSON.parse(json)
  end

  def body
    return @json['webhook_event']['body']
  end

  def from
    return @json['webhook_event']['from_account_id']
  end

  def to
    return @json['webhook_event']['to_account_id']
  end

  def room
    return @json['webhook_event']['room_id']
  end
end
