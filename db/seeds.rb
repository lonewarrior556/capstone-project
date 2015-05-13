
primary = User.create!(email: "luckyluke@yahoo.com", username: "luckyluke", fname: "luke", password: "password")

second = User.create!(email: "yams@yahoo.com", username: "yams", fname: "luke", password: "password")


question1 = Question.create!(title: "what train runs faster from wycoff?", user_id: 1, body: "what train would be faster into 598 broadway in manhattan the l or the m?")

question2 = Question.create!(title: "question2", user_id: 1, body: "is this is the body of question 2?")

question3 = Question.create!(title: "question 3", user_id: 1, body: "is this is the body of question 3?")

question4 = Question.create!(title: "question 4", user_id: 1, body: "what is a question")

question5 = Question.create!(title: "other question 1", user_id: 2, body: "another perso asking a question?")

question6 = Question.create!(title: "other question 2", user_id: 2, body: "How do you know????")
