class RankingController < ApplicationController
  
  # Haveランキング取得
  def have 
    #SELECT item_id, COUNT(id) AS count FROM ownerships WHERE type = 'Have' GROUP BY item_id ORDER BY count(id) DESC LIMIT 10;
    @rank_items = Have.rank_items(10)
  end
  
  # Wantランキング取得
  def want
    #SELECT item_id, COUNT(id) AS count FROM ownerships WHERE type = 'Want' GROUP BY item_id ORDER BY count(id) DESC LIMIT 10;
    @rank_items = Want.rank_items(10)
  end
  
end
