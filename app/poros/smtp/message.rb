module Smtp
  class Message < String
    DEFAULT_CONTENT_TRANSFER_ENCODING = ContentTransferEncoding.new(
      ContentTransferEncoding::EIGHT_BIT
    )
    def initialize(value, content_type = ContentType.new(ContentType::HTML))
      super "#{value}\n"
      @content_type = content_type
    end

    def as_part_of_smtp_message
      Headers.new(
        @content_type.as_header,
        DEFAULT_CONTENT_TRANSFER_ENCODING.as_header,
        GenericHeader::NEW_LINE_HEADER
      ).to_s + self
    end
  end
end
