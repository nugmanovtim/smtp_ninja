require 'net/smtp'

module Smtp
  class Ninja
    def initialize(server, port, username, password)
      @server = server
      @port = port
      @username = username
      @password = password
    end

    def send_mail(email)
      authenticate { |conn| email.send_via(conn) }
    end

    private

    def authenticate
      smtp = Net::SMTP.new(@server, @port)
      smtp.enable_starttls
      smtp.start('localhost', @username, @password, :plain) do |conn|
        yield conn
      end
    end
  end
end
