
json.question do
  json.id @question.id
  json.title @question.title
  json.body @question.body
  json.author do
    json.authorId @question.user_id
    json.authorUsername @question.user.username
  end
  json.askDate @question.created_at
  json.bestReply @question.best_answer_id
  json.replies do
    json.array! @responses do |resp|
      json.id resp.id
      json.body resp.body
      json.authorId resp.user_id
      json.replyDate resp.created_at
    end
  end
end
