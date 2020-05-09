crumb :root do
  link "カフェ一覧", shops_path
end

crumb :user do |user|
  link user.username, user_path
end