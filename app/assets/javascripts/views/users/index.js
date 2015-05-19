CapstoneProject.Views.UsersIndex = Backbone.View.extend({

  template: JST["users/index"],


  initialize: function(options){
    this.collection = options.users
    this.render()
  },

  render: function(){
    this.$el.html(this.template({users: this.collection}))
    return this
  }


})
