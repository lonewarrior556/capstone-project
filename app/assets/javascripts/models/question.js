CapstoneProject.Models.IndexQuestion = Backbone.Model.extend({



})


CapstoneProject.Models.ShowQuestion = Backbone.Model.extend({
  url: function(){
      if (this.id){
        return "/api_questions/" + this.id
      }
      else{
        return "/api_questions"
      }
    },

    initialize: function(options){
      this.id = options.id
    },


})
