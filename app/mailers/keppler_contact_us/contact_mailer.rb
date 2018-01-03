module KepplerContactUs
  class ContactMailer < ActionMailer::Base
    def contact(client)
      @client = client
      mailer_to = KepplerContactUs::MessageSetting.first.mailer_to
      mailer_from = KepplerContactUs::MessageSetting.first.mailer_from
      mail(
        from: mailer_from,
        to: @client.email,
        subject: "Solicitud de Contacto | REIMCA"
      )
    end
  end
end
