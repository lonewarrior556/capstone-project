json.array! @users do |user|
  json.id user.id
  json.username user.username
  json.firstName user.fname
  json.image_url asset_path(user.avatar.url)
  json.memberSince user.created_at
end
