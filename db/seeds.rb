def extract_title(body, url_link)
  if body.index('<span class="title_text">').nil?
    debugger
  end
  start = body.index('<span class="title_text">') + '<span class="title_text">'.length
  fin = body.index('</span>',start)
  return body[start...fin]
end

def extract_replies(body, url_link)
  regex = /<b>[^<][\n]*.*nswer.*<\/b>/
  if body.index('<div class="answer_text">').nil?
    puts "one skipped for url: #{url_link}"
    return []
  end
  start = body.index('<div class="answer_text">') + '<div class="answer_text">'.length
  fin = body.index('</div>',start)
  all_answers = body[start...fin]
  all_answers = all_answers.gsub("<br />","").gsub(regex,"PPqq,z,qqPP")
  all_answers.split("PPqq,z,qqPP").select{|a| a.gsub(" ","").length > 5 }
end



bodies = ["just wondering", "does anybody know?", "need to settle a bet",
  "just looking for an answer", "any information would be appreciated",
  "thought of it this mornign but can't figure it out", "Thanks in advance!",
  "<img src='http://lorempixel.com/400/200/city/'>",
  "<img src='http://lorempixel.com/400/200/city/'>",
  "<img src='http://lorempixel.com/400/200/city/'>",
  "<img src='http://lorempixel.com/400/200/city/'>"]



100.times do |n|
  username = Faker::Internet.user_name + (n*3).to_s
  puts n*3
  User.create!(avatar: "http://loremflickr.com/320/240/#{n}", email: Faker::Internet.email(username), username: username, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: Faker::Internet.password(8))
end

Question.create!(id: 1, title: "what train runs faster from wycoff?", user_id: 1, body: "what train would be faster into 598 broadway in manhattan the l or the m?")
Response.create(question_id: 1, user_id: 2, body: "I have lived in bushwick for over a year and can tell you the 'M' is a much slower train")



GlobalConstants::SEED_LINKS.each_with_index do |url_link, i|
  puts url_link
  body =  Typhoeus.get( url_link, followlocation: true).response_body
  title = extract_title(body, url_link)
  Question.create!(id: i+2, title: title, user_id: rand(1..100), body: bodies.sample)
  extract_replies(body, url_link).each do |resp|
    Response.create(question_id: i+2, user_id: rand(1..100), body: resp )
  end
end
