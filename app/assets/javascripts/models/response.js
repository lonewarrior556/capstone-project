CapstoneProject.Models.Response = Backbone.Model.extend ({

  url: "/responses",


  initialize(options){
    this.question_id = options.id;
    this.body = options.body;
  }



})
