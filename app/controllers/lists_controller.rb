class ListsController < ApplicationController

  def index
  end

  def show
    @list = List.find(params[:id])
    if not params[:password].blank?
      @admin = true if params[:password] == @list.password.password
      @password = params[:password]
    end
    @total_penalties = @list.penalties.sum(:amount)
  end

  def reset
    amount_paid = params[:amount]
    if amount_paid.blank?
      head 400
      return
    end

    list = List.find(params[:id])
    puts "password #{list.password.password}"

    #check password
    if params[:password].blank? or not params[:password] == list.password.password
      head 400
      return
    end

    #Clearn penalties and Chores
    list.chores.destroy_all
    list.penalties.destroy_all

    #Send email
    notify_email = list.notifications.where(:role=>'choree')
    notify_email.each do |email|
      ChoreMailer.list_paid_and_closed(list,amount_paid,email.phone).deliver
    end

    head :ok
  end

end
