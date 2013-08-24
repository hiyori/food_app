def sign_in(user)
    remember_token=user.remember_token
    pp user.id
    pp "\n"
    pp user.remember_token
    pp "\n"
    pp remember_token
    get login_path(remember_token)
end
