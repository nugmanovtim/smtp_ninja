module Smtp
  class Attachment
    DEFAULT_CONTENT_TRANSFER_ENCODING = ContentTransferEncoding.new(
      ContentTransferEncoding::BASE_64
    )
    def initialize(name, body)
      @name = name
      @body = body
    end

    def as_part_of_smtp_message
      Headers.new(
        ContentType.new(ContentType::MULTIPART_MIXED, name: "\"#{@name}\"").as_header,
        DEFAULT_CONTENT_TRANSFER_ENCODING.as_header,
        ContentDisposition.new(ContentDisposition::ATTACHMENT, "\"#{@name}\"").as_header,
        GenericHeader::NEW_LINE_HEADER
      ).to_s + encoded_body
    end

    private

    def encoded_body
      [@body].pack('m')
    end
  end
end
