if Rails.env.development?
  User.create!(
    email: "dmp@dmp.dmp",
    password: "password",
    password_confirmation: "password"
  )
end
