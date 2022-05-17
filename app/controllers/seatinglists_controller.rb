class SeatinglistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = SeatingList.includes(:user).order(:table)
    # 条件はログインユーザー
    @tables = SeatingList.where(user_id: current_user.id)
    
    # 各テーブルに座るゲストを配列に入れる
    @Atable_nameLists = []
    @Btable_nameLists = []
    @Ctable_nameLists = []
    @Dtable_nameLists = []
    @Etable_nameLists = []
    @Ftable_nameLists = []

    # 配列の要素を追加するためpush(追加する要素)を使用
    @lists.each do |list|
      if list.table == 'A'
        @Atable_nameLists.push(list.user.name)
      elsif list.table == 'B'
        @Btable_nameLists.push(list.user.name)
      elsif list.table == 'C'
        @Ctable_nameLists.push(list.user.name)
      elsif list.table == 'D'
        @Dtable_nameLists.push(list.user.name)
      elsif list.table == 'E'
        @Etable_nameLists.push(list.user.name)
      elsif list.table == 'F'
        @Ftable_nameLists.push(list.user.name)
      end
    end
  end

  def new
  end

  def create
  end
end
