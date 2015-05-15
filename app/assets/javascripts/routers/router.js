CapstoneProject.Routers.Router = Backbone.Router.extend({

  routes: { '': 'top',
  'questions': 'index',
  'questions/unanswered': 'unanswered',
  'questions/:id': 'show'
  },

  initialize: function(options){
    this.collection = options.collection
    this.root$el = options.root$el
  },

  top: function(){
    this._emptyAppend("Top Questions")
    this.collection.comparator = function(model){return -model.get("responses")}
    this.questions(this.collection)
  },

  index: function(){
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

  show: function(id){
    this._emptyAppend();
    var that = this
    CapstoneProject.view = new CapstoneProject.Views.QuestionShow({id: id})
    $.when(CapstoneProject.view.responses.fetch(), CapstoneProject.view.question.fetch()
      ).then(function(){
      that.root$el.html(CapstoneProject.view.render().$el)})
    },


    _emptyAppend: function(title){
      this.root$el.empty()
      this.root$el.append("<h1>"+title+"</h1>")
    }

  })
