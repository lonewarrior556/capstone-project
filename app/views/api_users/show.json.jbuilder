json.user do
  json.thyself @thyself
  json.id @user.id
  json.email @user.email
  json.username @user.username
  json.fname @user.fname
  json.lname @user.lname
  json.created_at @user.created_at
  json.image_url asset_path(@user.avatar.url)
  json.num_quesitons @questions.length

  json.questions do
    json.array! @questions do |question|
      json.id question.id
      json.title question.title
      json.count question.responses.length
      json.timestamp question.created_at
    end
  end

  json.num_answers @responses.length
  json.answers do
    json.array! @responses do |resp|
      json.question_id resp.question_id
      json.title resp.question.title
      json.timestamp resp.created_at
    end
  end
end
