json.array! @questions do |question|
  json.id question.id
  json.title question.title
  json.author question.user.username
  json.responses question.responds
  json.askDate question.created_at
  json.bestReply question.best_answer_id
  json.thumb asset_path(question.user.avatar.url(:thumb))
end
