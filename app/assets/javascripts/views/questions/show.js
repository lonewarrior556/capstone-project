CapstoneProject.Views.QuestionShow = Backbone.View.extend({

  template: JST["questions/show"],

  initialize: function(options){
    this.id = options.id;
    this.question = new CapstoneProject.Models.ShowQuestion({id: this.id})
    this.responses = new CapstoneProject.Collections.Responses({id: this.id})
  },

  events: { "click .answer-button": "submit" },

  render: function(){
    this.$el.html(this.template({question: this.question, responses: this.responses}))
    return this
  },

  submit: function(event){
    event.preventDefault()
    var options = this.$el.find(".answer-form").serializeJSON().response
    var resp = new CapstoneProject.Models.Response({})
    resp.set(options)
    resp.save()
    Backbone.history.navigate("")
    Backbone.history.navigate("questions/"+this.id,{trigger: true})
  }




})
