module Smtp
  class Email
    def initialize(from, to, subject, message)
      @from = from
      @to = to
      @subject = subject
      @message = message
    end

    def send_via(conn)
      smtp_message = as_smtp_message
      puts smtp_message
      conn.send_message smtp_message, @from, @to
    end

    private

    def as_smtp_message
      main_headers.to_s + @message.as_part_of_smtp_message
    end

    def main_headers
      Headers.new(
        from_and_to_headers,
        mime_version_header,
        @subject.as_header
      )
    end

    def mime_version_header
      Header.new(Header::MIME_VERSION, '1.0')
    end

    def from_and_to_headers
      Headers.new(
        FromHeader.new(@from),
        *ToHeaders.new(@to)
      )
    end
  end
end
