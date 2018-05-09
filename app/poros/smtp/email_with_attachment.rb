module Smtp
  class EmailWithAttachment < Email
    def initialize(from, to, subject, message, attachment)
      @attachment = attachment
      super from, to, subject, message
    end

    private

    def as_smtp_message
      [
        main_headers.to_s,
        @message.as_part_of_smtp_message,
        @attachment.as_part_of_smtp_message
      ].join(boundary_header) +
        ending_boundary_header
    end

    def main_headers
      Headers.new(
        super,
        ContentType.new(
          ContentType::MULTIPART_MIXED, boundary: boundary
        ).as_header
      )
    end

    def boundary
      'AUNIQUEDELIMITER'
    end

    def boundary_header
      @boundary_header ||= BoundaryHeader.new(boundary)
    end

    def ending_boundary_header
      @ending_boundary_header ||= EndingBoundaryHeader.new(boundary)
    end
  end
end
