class WeeksInLivesMailer < ApplicationMailer
  layout nil

  def week_reminder(account)
    @account = account
    mail(to: account.email, subject: "Připomínka: Zapište si svůj týden ")
  end
end
