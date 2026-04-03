# ゲストユーザーを作成する（すでに存在する場合はスキップ）
User.find_or_create_by!(email: "guest@example.com") do |user|
  user.password = SecureRandom.hex(10)
  user.password_confirmation = user.password
end