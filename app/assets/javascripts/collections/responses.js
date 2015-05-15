CapstoneProject.Collections.Responses = Backbone.Collection.extend({
  // model: CapstoneProject.Models.Response,

  url: function(){ return "api_questions/" + this.id + "/api_responses"
  },

  initialize: function(options){
    this.id = options.id
  },


})
