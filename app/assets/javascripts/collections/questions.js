CapstoneProject.Collections.IndexQuestions = Backbone.Collection.extend({
  model: CapstoneProject.Models.IndexQuestion,
  url: '/api_questions',

  comparator: "id",



})

CapstoneProject.Collections.ShowQuestion = Backbone.Collection.extend({
  model: CapstoneProject.Models.ShowQuestion,



})
