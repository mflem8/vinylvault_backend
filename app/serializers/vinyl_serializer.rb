class VinylSerializer
  include JSONAPI::Serializer
  attributes :title, :artist, :image_url, :genre_id, :genre
end
