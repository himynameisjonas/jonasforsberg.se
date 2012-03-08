require 'liquid'
require 'fleakr'

Fleakr.api_key = "c794c3f00be2130085e3cdef2f06aeb6"
Fleakr.shared_secret = "12661a297b1dfd88"
Fleakr.auth_token = "72157629177895598-293ceaacc4143984"

CACHED_IMAGES = {}

module Flickr
  def flickr_image(url)
    return "<img class='flickr-image align-center' alt='#{image_object(url).title}' src='#{image_object(url).large.url}'>"
  end

  def flickr_medium_image(url)
    return "<img class='flickr-image align-center' alt='#{image_object(url).title}' src='#{image_object(url).medium.url}'>"
  end

  private

  def image_object(url)
    CACHED_IMAGES[url] ||= Fleakr.resource_from_url(url)
  end
end

Liquid::Template.register_filter(Flickr)
