class SmtpNinjaController < ApplicationController
  def new
    @send_email_form = SendEmailForm.new
  end

  def send_mail
    @send_email_form = SendEmailForm.new(email_params)
    if @send_email_form.valid?
      @send_email_form.go
      render :new unless @send_email_form.errors.empty?
    else
      render :new
    end
  end

  private

  def email_params
    params.require(:send_email_form)
          .permit(:username, :password,
                  :server, :port,
                  :from, :to,
                  :subject, :message, :attachment)
  end
end
