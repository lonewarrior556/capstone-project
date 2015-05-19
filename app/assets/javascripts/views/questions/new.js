CapstoneProject.Views.QuestionNew = Backbone.View.extend({

  template: JST["questions/new"],

  initialize: function(){
  },

  render: function(){
    this.$el.html(this.template({a: 'a'}))
    return this
  }







})
