# encoding: UTF-8
module UsersHelper

  def user_role(role)
    if role == "super_admin"
      "Super Admininistrator"
    elsif role == "admin"
      "Administrator"
    elsif role == "investor"
      role.capitalize
    elsif role == "visitor"
      "Gæst"
    end
  end
end