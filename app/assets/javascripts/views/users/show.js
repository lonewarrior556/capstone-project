CapstoneProject.Views.UserShow = Backbone.View.extend({

  template: JST["users/show"],

  events: { "submit .avatar-update": "changeProfilePic",
            "click .user-show-tab-title.questions-tab": "showQuestions",
            "click .user-show-tab-title.answers-tab": "showAnswers"},


  initialize: function(options){
    this.user = options.user
    this.user.askedQuestions.comparator = "timestamp";
    this.user.answeredQuestions.comparator = "timestamp";
    this.SubViewAsked = $('<div class="asked"></div>')
    this.SubViewAnswered = $('<div class="answered"></div>')
    this.renderSubView(this.SubViewAsked,this.user.askedQuestions.sort())
    this.renderSubView(this.SubViewAnswered,this.user.answeredQuestions.sort())
  },

  render: function(){
    this.$el.html(this.template({user: this.user}))
    this.$el.find(".history").append('<h1 class="user-show-tab-title questions-tab group in-front">Questions</h1>')
    this.$el.find(".history").append('<h1 class="user-show-tab-title answers-tab group in-back">Answers</h1>')
    this.$el.find(".history").append(this.SubViewAsked)
    this.$el.find(".history").append(this.SubViewAnswered)
    this.$el.find(".asked .user-show-tab-title").addClass("in-front questions-tab")
    this.$el.find(".asked .question-index-false").addClass("in-front questions-tab")
    this.$el.find(".answered .user-show-tab-title").addClass("in-back answers-tab")
    this.$el.find(".answered .question-index-false").addClass("in-back answers-tab")
    return this;
  },

  renderSubView: function(subView, collection){
    subView.empty()
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

  showQuestions: function(event){
    console.log("clicked")
    $(".answers-tab").addClass("in-back").removeClass("in-front")
    $(".questions-tab").removeClass("in-back").addClass("in-front")
  },

  showAnswers: function(event){
    console.log("clicked")
    $(".questions-tab").addClass("in-back").removeClass("in-front")
    $(".answers-tab").removeClass("in-back").addClass("in-front")
  },




})
