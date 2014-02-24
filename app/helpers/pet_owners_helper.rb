module PetOwnersHelper
  def gravatar_for(pet_owner)
      gravatar_id = Digest::MD5::hexdigest(pet_owner.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: pet_owner.username, class: "gravatar")
    end
end
