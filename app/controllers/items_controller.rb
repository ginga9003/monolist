class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show] # show以外のときにはログインチェック
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      # 検索文字列がある場合はAPI経由で一覧取得
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
      
      #binding.pry
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
