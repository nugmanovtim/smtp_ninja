class SendEmailForm
  include ActiveModel::Model
  ESSENTIAL_FIELDS = %i[username password server port from to subject message].freeze
  attr_accessor(*ESSENTIAL_FIELDS)

  ESSENTIAL_FIELDS.each { |field| validates field, presence: true }
  validates :port, numericality: true
  validates_format_of :from, with: Smtp::EmailAddress::REGEX
  validate do
    errors.add :to, 'Invalid recipient(s) format' unless to.split(', ').all? { |e| e =~ Smtp::EmailAddress::REGEX }
  end

  def go
    ninja.send_mail(email)
  rescue RuntimeError, SocketError => e
    errors.add :base, "An error occured: #{e.message}"
  end

  private

  def ninja
    @ninja ||= Smtp::Ninja.new(@server, @port, @username, @password)
  end

  def email
    @email ||= Smtp::Email.new(sender, recipients, Smtp::Subject.new(@subject), Smtp::Message.new(@message))
  end

  def sender
    @sender ||= Smtp::EmailAddress.new(@from)
  end

  def recipients
    @recipients ||= Smtp::EmailAddresses.new(@to)
  end
end
