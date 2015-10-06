class RankingController < ApplicationController
  
  # Haveランキング取得
  def have 
    #SELECT item_id, COUNT(id) AS count FROM ownerships WHERE type = 'Have' GROUP BY item_id ORDER BY count(id) DESC LIMIT 10;
    @rank_items = Have.rank_items(10)
    @rank_items = rank(@rank_items)
    # code review    
#    ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
#    @items = Item.find(ids).sort_by{|o| ids.index(o.id)}
  end
  
  # Wantランキング取得
  def want
    #SELECT item_id, COUNT(id) AS count FROM ownerships WHERE type = 'Want' GROUP BY item_id ORDER BY count(id) DESC LIMIT 10;
    @rank_items = Want.rank_items(10)
    @rank_items = rank(@rank_items)
    
    # code review
#    ids = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
#    @items = Item.find(ids).sort_by{|o| ids.index(o.id)}
  end
  
  # ランク付け
  private
  def rank(rank_items)
    newRankItems = {}
    
    oldCount = 0
    ranking = 1
    totalRanking = 1
    rank_items.each{|key, value|
      
      #binding.pry
      if value != oldCount
        # ランクを足す
        ranking = totalRanking
      end
      
      dataHash = {}
      dataHash['count'] = value
      dataHash['rank'] = ranking
      newRankItems[key] = dataHash

      totalRanking += 1
      oldCount = value
    }
    
    return newRankItems
  end
end
