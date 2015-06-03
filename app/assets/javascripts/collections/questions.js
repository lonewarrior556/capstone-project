CapstoneProject.Collections.IndexQuestions = Backbone.Collection.extend({
  model: CapstoneProject.Models.IndexQuestion,
  url: function(){ return '/api_questions?page=' + this.page },

  comparator: "id",

  page: 0


})

CapstoneProject.Collections.ShowQuestion = Backbone.Collection.extend({
  model: CapstoneProject.Models.ShowQuestion,



})
