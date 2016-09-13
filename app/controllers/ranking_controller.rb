class RankingController < ApplicationController
  def have
    @title = "Haveランキング"
    ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = ranking.keys
    @items = Item.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
    render 'ranking'
  end

  def want
    @title = "Wantランキング"
    ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = ranking.keys
    @items = Item.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
    render 'ranking'
  end
end
