module KepplerContactUs
  # Preview all emails at http://localhost:3000/rails/mailers/contact
  class ContactPreview < ActionMailer::Preview

  	def contact
  		cliente = Message.new(name:"HOla")
  		ContactMailer.contact(cliente)
  	end

  end
end
