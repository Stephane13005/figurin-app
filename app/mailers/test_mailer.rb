class TestMailer < ApplicationMailer
  default from: 'admin@figurinapp.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.hello.subject
  #
  def hello
    mail(
      subject: 'Hello from Postmark',
      to: 'severio.stephane@gmail.com',
      from: 'admin@figurinapp.com',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'outbound'
    )
  end
end
