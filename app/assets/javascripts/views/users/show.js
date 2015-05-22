CapstoneProject.Views.UserShow = Backbone.View.extend({

  template: JST["users/show"],

  events: { "submit .avatar-update": "changeProfilePic"},

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
  },

  changeProfilePic: function(event){
    $(".avatar-submit").addClass("invisible").removeClass("visible")
    event.preventDefault()
    var options = this.$el.find(".avatar-update").serializeJSON()
    var user = new CapstoneProject.Models.User
    var file = this.$el.find("#user_avatar")[0].files[0]

    var fd = new FormData(document.getElementById("avatarupdate"));

    var that = this
    $.ajax({
      url: "/api_users",
      type: "PATCH",
      data: fd,
      processData: false,  // tell jQuery not to process the data
      contentType: false,   // tell jQuery not to set contentType
      success: function(image_urls){
        $(".thumb").attr("src", image_urls.thumb)
        that.$el.find("#avatar").attr("src", image_urls.medium)
        CapstoneProject.router.collection.fetch()
        CapstoneProject.router.users && CapstoneProject.router.users.fetch()
      }
    });
  },





})
