CapstoneProject.Views.QuestionIndex = Backbone.View.extend({

  template: JST["questions/index"],

  initialize: function(options){
    this.collection = options.collection
  },

  events: {"click a": "questionShow"},

  render: function(){
    this.$el.html(this.template({questions: this.collection}))
    return this
  },

  questionShow: function(event){
    event.preventDefault()
    var address = event.currentTarget.hash.slice(1)
    Backbone.history.navigate(address, {trigger: true})
  }




})
