module ExpertsHelper
  def gravatar_for(expert)
      gravatar_id = Digest::MD5::hexdigest(expert.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: expert.username, class: "gravatar")
    end
end
