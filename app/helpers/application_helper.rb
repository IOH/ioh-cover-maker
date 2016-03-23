module ApplicationHelper
  def gravatar_url(email, size)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    # default_url = "http://i.imgur.com/H6uXkRO.png"
    default_url = "http://i.stack.imgur.com/SE2cv.jpg"
    url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
  end
end
