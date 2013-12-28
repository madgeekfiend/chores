class ListsController < ApplicationController

  def index
  end

  def show
    @list = List.find(params[:id])
    if not params[:password].blank?
      @admin = true if params[:password] == @list.password.password
    end
    @total_penalties = @list.penalties.sum(:amount)
  end

  def reset
    amount_paid = params[:amount]
    if amount_paid.blank?
      head 400
    end

    list = List.find(params[:id])
    #Clearn penalties and Chores

    head :ok
  end

end
