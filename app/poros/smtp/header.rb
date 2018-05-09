module Smtp
  class Header < GenericHeader
    TO = 'To'.freeze
    FROM = 'From'.freeze
    CONTENT_TYPE = 'Content-type'.freeze
    MIME_VERSION = 'MIME-Version'.freeze
    SUBJECT = 'Subject'.freeze
    CONTENT_TRANSFER_ENCODING = 'Content-Transfer-Encoding'.freeze
    CONTENT_DISPOSITION = 'Content-Disposition'.freeze
    def initialize(key, value)
      super "#{key}: #{value}"
    end
  end
end
