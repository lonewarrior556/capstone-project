CapstoneProject.Routers.Router = Backbone.Router.extend({

  routes: { '': 'questionTop',
  'users': 'usersIndex',
  'questions': 'questionIndex',
  'questions/unanswered': 'unanswered',
  'users/:id': 'userShow',
  'questions/:id': 'questionShow'
  },

  initialize: function(options){
    this.collection = options.collection
    this.root$el = options.root$el
  },

  questionTop: function(){
    this._emptyAppend("Top Questions")
    this.collection.comparator = function(model){return -model.get("responses")}
    this.questions(this.collection)
  },

  questionIndex: function(){
    this._emptyAppend("All Questions")
    this.collection.comparator = function(model){return model.get("id")}
    this.questions(this.collection)
  },

  unanswered: function(){
    this._emptyAppend("Unanswered Questions");
    var models = this.collection.where({"bestReply": null});
    this.questions(new CapstoneProject.Collections.IndexQuestions(models))
  },

  questions: function(collection){
    var view = new CapstoneProject.Views.Questions({collection: collection.sort()});
    this.root$el.append(view.render().$el)
    },

  questionShow: function(id){
    this._emptyAppend();
    var that = this
    CapstoneProject.view = new CapstoneProject.Views.QuestionShow({id: id})
    $.when(CapstoneProject.view.responses.fetch(), CapstoneProject.view.question.fetch()
      ).then(function(){
      that.root$el.html(CapstoneProject.view.render().$el)})
    },

  usersIndex: function(){
    var that = this;
    if (!this.users){
      this.users = new CapstoneProject.Collections.Users()
    }
    this._emptyAppend("Users")
    this.users.fetch({
      success: function(users){
        var view = new CapstoneProject.Views.UsersIndex({users: users})
        that.root$el.append(view.render().$el)
      }
    })
  },

  userShow: function(id){
    var that = this;
    var user = new CapstoneProject.Models.User({id: id})
    this._emptyAppend("")
    user.fetch({
      success: function(user){
        var view = new CapstoneProject.Views.UserShow({user: user})
        that.root$el.html(view.render().$el)
      }
    })
  },


    _emptyAppend: function(title){
      this.root$el.empty()
      this.root$el.append("<h1>"+title+"</h1>")
    }

  })
