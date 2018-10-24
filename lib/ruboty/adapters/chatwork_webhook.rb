require 'webrick'
require 'chatwork'
require 'json'
require 'model/mention'

module Ruboty
  module Adapters
    class ChatworkWebhook < Base
      include Mem
      env :CHATWORK_API_TOKEN, "Chatwork API Token"
      env :WEBHOOK_LISTEN_PORT, "Port number for webhook"
      
      def initialize(*args)
        super
        server
      end

      def run
        listen
      end

      def say(message)
        ChatWork::Message.create(room_id: message[:original][:room_id],
                                 body: message[:body])
      end

      private
      def listen
        server.start
      end

      def server
        server = WEBrick::HTTPServer.new({
          Port:           ENV['WEBHOOK_LISTEN_PORT'],
        })
        server.mount_proc '/test' do |req, res|
          mention = Mention.new(req.body)
          pp 'received-> ' + mention.body
          robot.receive(body: mention.body,
                        from_id: mention.from_account_id,
                        room_id: mention.room_id,
                        mention: mention)
        end
        server
      end
      memoize :server
    end
  end
end
