require 'json'

class Mention
  def initialize(json)
    @json = JSON.parse(json)
  end

  def body
    return @json['webhook_event']['body']
  end

  def from_account_id
    return @json['webhook_event']['from_account_id']
  end

  def to_account_id
    return @json['webhook_event']['to_account_id']
  end

  def room_id
    return @json['webhook_event']['room_id']
  end

  def message_id
    return @json['webhook_event']['message_id']
  end
end
