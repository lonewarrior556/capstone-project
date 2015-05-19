CapstoneProject.Models.Response = Backbone.Model.extend ({

  url: "/responses",


  initialize: function(options){
    this.question_id = options.id;
    this.body = options.body;
  }



});
