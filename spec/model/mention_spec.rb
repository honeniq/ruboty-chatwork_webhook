require 'spec_helper'
webhook_body = <<-'EOS'
{
  "webhook_setting_id": "2655",
  "webhook_event_type": "mention_to_me",
  "webhook_event_time": 1540303302,
  "webhook_event": {
    "from_account_id": 624077,
    "to_account_id": 3430971,
    "room_id": 125733107,
    "message_id": "1106581974606151680",
    "body": "[To:3430971] honeniq_botさん\n" + "adsfadf",
    "send_time": 1540303302,
    "update_time": 0
  }
}
EOS

RSpec.describe Mention do
  let(:mention) do
    Mention.new(webhook_body)
  end
end
