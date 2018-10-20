require 'webrick'
require 'chatwork'

module Ruboty
  module Adapters
    class ChatworkWebhook < Base
      include Mem
      env :CHATWORK_API_TOKEN, "Chatwork API Token"
      env :CHATWORK_ROOM,      "Chatwork Room ID"
      
      def initialize(*args)
        super
        server
        pp 'start!'
      end

      def run
        listen
      end

      def say(message)
        ChatWork::Message.create(room_id: ENV['CHATWORK_ROOM'], body: "Hello, ChatWork!")
      end

      private
      def listen
        server.start
      end

      def server
        server = WEBrick::HTTPServer.new({
          BindAddress:    '127.0.0.1',
          Port:           3000,
        })
        server.mount_proc '/test' do |req, res|
          body = req.body
          robot.receive(body: body)
          pp 'aaaa'
        end
        server
      end
      memoize :server

    end
  end
end
