json.array! @responses do |resp|
  json.id resp.id
  json.question_id resp.question_id
  json.user_id resp.user_id
  json.body resp.body
  json.username resp.user.username
  jspn.image_url asset_path(user.avatar.url)
  json.created_at resp.created_at
end
