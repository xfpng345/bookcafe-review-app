crumb :top do
  link "トップページ", root_path
end

crumb :shops do
  link "カフェ一覧", shops_path
  parent :top
end

crumb :user do |user|
  link user.username, user_path
  parent :shops
end

crumb :shop do |shop|
  link shop.name, shop_path
  parent :shops
end

crumb :edit_shop do |shop|
  link "編集", edit_shop_path
  parent :shop, shop
end