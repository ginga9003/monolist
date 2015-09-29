class Want < Ownership
  
    # ランキングの指定件数を返す
  def self.rank_items(limit=10)
     Want.all.group("ownerships.item_id").order('count_all desc').limit(limit).count()
  end
end
