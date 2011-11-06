def password_reset(user)
  default :from => "test@example.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Nulstil kodeord"
  end
end