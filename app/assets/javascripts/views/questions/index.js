CapstoneProject.Views.Questions = Backbone.View.extend({

  template: JST["questions/index"],

  initialize: function(options){
    this.collection = options.collection
    this.listenTo(this.collection, "sync", this.render)
  },

  events: {"click a": "questionShow",
          "click .more-questions": "showMore"},

  render: function(){
    this.$el.html(this.template({questions: this.collection}))
    return this
  },

  questionShow: function(event){
    event.preventDefault()
    var address = event.currentTarget.hash.slice(1)
    Backbone.history.navigate(address, {trigger: true})
  },

  showMore: function(event){
    var that = this
    this.collection.page++
    this.collection.fetch()
  }




})
