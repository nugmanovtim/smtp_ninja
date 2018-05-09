module Smtp
  class Email
    def initialize(from, to, subject, message)
      @from = from
      @to = to
      @subject = subject
      @message = message
    end

    def send_via(conn)
      conn.send_message as_smtp_message, @from, @to
    end

    private

    def as_smtp_message
      Headers.new(
        FromHeader.new(@from),
        *ToHeaders.new(@to),
        Header.new(Header::MIME_VERSION, '1.0'),
        @message.content_type.as_header,
        @subject.as_header
      ).to_s + @message
    end
  end
end
