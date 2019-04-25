class SerializableShortLink < JSONAPI::Serializable::Resource
  type :short_links

  attribute :email
  attribute :resource_url
  attribute :redirect_url
  attribute :original_url
end
