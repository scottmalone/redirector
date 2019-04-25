class SerializableShortLink < JSONAPI::Serializable::Resource
  type :short_links

  attribute :email
  attribute :short_url
  attribute :original_url
end
