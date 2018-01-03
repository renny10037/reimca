module EmailHelper
  def email_image_tag(image, **options)
    attachments[image] = File.read(Rails.root.join("app/assets/images/img/#{image}"))
    image_tag attachments[image].url, **options
  end
  def email_product_image_tag(image, **options)
    attachments[image] = File.read(Rails.root.join("#{image_url(image)}"))
    image_tag attachments[image].url, **options
  end
end
