CapstoneProject.Routers.Router = Backbone.Router.extend({

  routes: { '': 'index',
  'questions': 'index',
  'questions/:id': 'show'
  },

  initialize: function(options){
    this.collection = options.collection
    this.root$el = options.root$el
  },


  index: function(){
    var view = new CapstoneProject.Views.QuestionIndex({collection: this.collection})
    this.root$el.html(view.render().$el)
  },

  show: function(id){
    var that = this
    CapstoneProject.view && CapstoneProject.view.remove()
    CapstoneProject.view = new CapstoneProject.Views.QuestionShow({id: id})

    $.when(CapstoneProject.view.responses.fetch(), CapstoneProject.view.question.fetch()
      ).then(function(){
      that.root$el.html(CapstoneProject.view.render().$el)})
    },



  })
