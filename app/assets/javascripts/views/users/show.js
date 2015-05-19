CapstoneProject.Views.UserShow = Backbone.View.extend({

  template: JST["users/show"],

  initialize: function(options){
    this.user = options.user
    this.user.askedQuestions.comparator = "timestamp";
    this.user.answeredQuestions.comparator = "timestamp";

    this.SubViewAsked = $('<div class="asked"></div>')
    this.SubViewAnswered = $('<div class="answered"></div>')
    this.renderSubView(this.SubViewAsked,"Questions",this.user.askedQuestions.sort())
    this.renderSubView(this.SubViewAnswered,"Answers",this.user.answeredQuestions.sort())

  },


  render: function(){
    this.$el.html(this.template({user: this.user}))
    this.$el.find(".history").append(this.SubViewAsked)
    this.$el.find(".history").append(this.SubViewAnswered)
    return this;
  },

  renderSubView: function(subView, name, collection){
    subView.empty()
    subView.append("<h1>" + name+"</h1>")
    var view = new CapstoneProject.Views.Questions({collection: collection})
    subView.append(view.render().$el)
  }


})
