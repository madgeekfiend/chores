class ListsController < ApplicationController

  def index
  end

  def show
    @list = List.find(params[:id])
    @admin = true if params[:password] == @list.password.password
    @total_penalties = @list.penalties.sum(:amount)
  end

end
