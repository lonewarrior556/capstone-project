CapstoneProject.Views.QuestionNew = Backbone.View.extend({

  template: JST["questions/new"],

  events: { "click .post-question" : "postQuestion"

  },

  initialize: function(){
  },

  render: function(){
    this.$el.html(this.template({a: 'a'}))
    return this
  },

  postQuestion: function(event){
    event.preventDefault()
    var that = this
    var options = this.$el.find(".question-form").serializeJSON()
    options.body = (new nicEditors.findEditor("body")).getContent()
    var question = new CapstoneProject.Models.ShowQuestion(options)

    question.save({},{
      success: function(question){

        question.fetch({
          success: function(question){
            CapstoneProject.router.collection.fetch()
            Backbone.history.navigate("questions/"+question.id,{trigger:true})}
        })
      },

      error: function(question, errors){
        var keys = Object.keys(errors.responseJSON)
        var messages = errors.responseJSON
        keys.forEach(function(key){
          that.$el.find(".errors").append("<li>"+ key +" "+ messages[key]+"</li>")
        })
      }
    })
  }







})
