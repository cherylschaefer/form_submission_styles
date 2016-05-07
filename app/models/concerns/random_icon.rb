module RandomIcon
  extend ActiveSupport::Concern

  included do
    after_create :assign_random_icon
  end

  private
  def assign_random_icon
    self.update(image: ICON_HASH[self.class.to_s].sample)
  end

  ICON_HASH = {
    "Diamond" => ["diamond", "diamond-round", "diamond-ring", "diamond-bracelet"],
    "Putty" => ["putty-plumbers", "putty-serious-comic", "putty-silly-red", "putty-computers"],
    "Snowflake" => ["snowflake", "snowflake-1", "snowflake-2", "snowflake-3", "snowflake-bbt", "snowflake-bentley", "snowflake-clownfish", "snowflake-cookie", "snowflake-frozen", "snowflake-googley-eyes", "snowflake-necklace", "snowflake-obsidian", "snowflake-plant", "snowflake-star-wars"],
    "Tribble" => ["tribble-3", "tribble-brown", "tribble-cereal", "tribble-kirk", "tribble-pink-animated", "tribble-quark", "tribble-reese"]
  }

end
