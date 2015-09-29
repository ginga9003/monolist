class Have < Ownership
  
  # ランキングの指定件数を返す
  def self.rank_items(limit=10)
     Have.all.group("ownerships.item_id").order('count_all desc, created_at desc').limit(limit).count()
  end
end
