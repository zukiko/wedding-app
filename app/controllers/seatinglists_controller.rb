class SeatinglistsController < ApplicationController
  def index
    @lists=SeatingList.includes(:user).order(:table)

    @Atable_nameLists=[]
    @Btable_nameLists=[]
    @Ctable_nameLists=[]

    @lists.each do |list|
        
      if list.table == 'A'
        @Atable_nameLists.push(list.user.last_name)
      elsif list.table == 'B'
        @Btable_nameLists.push(list.user.last_name)
      elsif list.table == 'C'
        @Ctable_nameLists.push(list.user.last_name)
      end

    end
  end

  def new
    
  end

  def create
    
  end
end
