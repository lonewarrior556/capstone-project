CapstoneProject.Views.UserShow = Backbone.View.extend({

  template: JST["users/show"],

  initialize: function(options){
    this.user = options.user
    this.user.askedQuestions.comparator = "timestamp"
    this.user.answeredQuestions.comparator = "timestamp"
    this.SubView = $("<div></div>")
    this.renderSubView("Questions",this.user.askedQuestions.sort())
  },


  render: function(){
    this.$el.html(this.template({user: this.user}))
    this.$el.find(".history").append(this.SubView)
    return this;
  },

  renderSubView: function(name, collection){
    this.SubView.empty()
    this.SubView.append("<h1>" + name+"</h1>")
    var view = new CapstoneProject.Views.Questions({collection: collection})
    this.SubView.append(view.render().$el)
  }


})
