require 'spec_helper'
webhook_body = <<-'EOS'
{
    "webhook_setting_id": "12345",
    "webhook_event_type": "mention_to_me",
    "webhook_event_time": 1498028130,
    "webhook_event":{
        "from_account_id": 123456,
        "to_account_id": 1484814,
        "room_id": 567890123,
        "message_id": "789012345",
        "body": "Hello.",
        "send_time": 1498028125,
        "update_time": 0
    }
}
EOS

webhook_body_with_to = <<-'EOS'
{
    "webhook_setting_id": "12345",
    "webhook_event_type": "mention_to_me",
    "webhook_event_time": 1498028130,
    "webhook_event":{
        "from_account_id": 123456,
        "to_account_id": 1484814,
        "room_id": 567890123,
        "message_id": "789012345",
        "body": "[To:1484814]rubotyさん\nHello.",
        "send_time": 1498028125,
        "update_time": 0
    }
}
EOS

RSpec.describe Mention do
  let(:mention) do
    Mention.new(webhook_body)
  end
  let(:mention_with_to) do
    Mention.new(webhook_body_with_to)
  end

  describe "#body" do
    context "1on1 chat" do
      it "returns message body" do
        expect(mention.body).to eq("Hello.")
      end
    end
    context "group chat" do
      it "returns message body without first line" do
        expect(mention_with_to.body).to eq("Hello.")
      end
    end
  end

  describe "#from_account_id" do
    it "returns from_account_id" do
      expect(mention.from_account_id).to eq(123456)
    end
  end

  describe "#to_account_id" do
    it "returns to_account_id" do
      expect(mention.to_account_id).to eq(1484814)
    end
  end

  describe "#room_id" do
    it "returns room_id" do
      expect(mention.room_id).to eq(567890123)
    end
  end

  describe "#message_id" do
    it "returns message_id" do
      expect(mention.message_id).to eq("789012345")
    end
  end

end
