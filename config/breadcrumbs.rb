crumb :top do
  link "トップページ", root_path
end

crumb :shops do
  link "カフェ一覧", shops_path
  parent :top
end

crumb :user do |user|
  link user.username, user_path(user)
  parent :shops
end

crumb :edit_user do |user|
  link "編集", edit_user_registration_path
  parent :user, user
end

crumb :following_user do |user|
  link "フォロー", following_user_path
  parent :user, user
end

crumb :followers_user do |user|
  link "フォロワー", followers_user_path
  parent :user, user
end

crumb :shop do |shop|
  link shop.name, shop_path
  parent :shops
end

crumb :edit_shop do |shop|
  link "編集", edit_shop_path
  parent :shop, shop
end