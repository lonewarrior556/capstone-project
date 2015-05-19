  json.id @question.id
  json.user_id @question.id
  json.username @question.user.username
  json.image_url asset_path(@question.user.avatar.url)
  json.title @question.title
  json.body @question.body
  json.created_at @question.created_at
  json.bestReply @question.best_answer_id
