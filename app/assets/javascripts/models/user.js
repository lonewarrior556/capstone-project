CapstoneProject.Models.User = Backbone.Model.extend({
  urlRoot: '/api_users/',

  parse: function(data){
    data = data.user
    this.askedQuestions = new CapstoneProject.Collections.IndexQuestions(data.questions);
    this.answeredQuestions = new CapstoneProject.Collections.IndexQuestions(data.answers);

    delete data.questions;
    delete data.answers;

    return data
  }

});

CapstoneProject.Models.indexUser = Backbone.Model.extend({


})
