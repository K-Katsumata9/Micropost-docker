class UserMailer < ApplicationMailer
  def account_activation(user)
		@user = user 
    mail to: @user.email, subject: "Account activation"
			# => app/views/user_mailer/account_activation.text.erb
			# => app/views/user_mailer/account_activation.html.erb
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password reset"
  end
end
