class ChoreMailer < ActionMailer::Base
  default from: "no-reply@codeomnib.us"

  def chore_added(chore,to_email)
    @chore = chore
    mail(to: to_email, subject: 'Chore Added')
  end

  def penalty_added(penalty,to_email)
    @penalty = penalty
    @total_penalty = Penalty.all.sum(:amount)
    mail(to: to_email, subject: 'Penalty Added')
  end

  def chore_completed(chore,to_email)
    @chore = chore
    mail(to: to_email, subject: 'Chore Completed')
  end

end
