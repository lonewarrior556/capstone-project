CapstoneProject.Collections.IndexQuestions = Backbone.Collection.extend({
  model: CapstoneProject.Models.IndexQuestion,
  url: '/api_questions',



})

CapstoneProject.Collections.ShowQuestion = Backbone.Collection.extend({
  model: CapstoneProject.Models.ShowQuestion,



})
