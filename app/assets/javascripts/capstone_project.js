window.CapstoneProject = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function(){
    $(".no-login").addClass("invisible");
    $("a, button").not( "#log-out, .links").on("click", function(event){
      event.preventDefault()
      event.stopPropagation();
      var hash = event.currentTarget.href.slice(7)
      var index = hash.indexOf("/")
      hash = hash.slice(index)
      Backbone.history.navigate(hash, {trigger: true})
      return false
    });


    $(".search-bar-box").focusout(function(){
      setTimeout(function(){ $("#live-search-results").empty(); }, 200)
    })
    $(".search-bar-box").keypress(function(event){
        if ($(event.currentTarget).val().length > 0 ){
          queryString =  $(event.currentTarget).val() + String.fromCharCode(event.keyCode)
          var results = $.ajax({ url: "/api_questions/search?search=" + queryString,
                                type: "GET",
                                success: function(results){
                                  $("#live-search-results").html(results)
                                  $("#live-search-results .static-search-results").on("click",function(event){
                                    event.preventDefault()
                                    event.stopPropagation()
                                    var link = event.target.href
                                    var idx = 1+ link.indexOf('users') + link.indexOf('questions')
                                    b_link = link.slice(idx,900)
                                    $("#live-search-results").empty();
                                    Backbone.history.navigate(b_link, {trigger: true})
                                  })
                                }
                                })
        }
   })


    CapstoneProject.indexQuestions = new CapstoneProject.Collections.IndexQuestions()

    CapstoneProject.indexQuestions.fetch({
      success: function(){

        CapstoneProject.router =
        new CapstoneProject.Routers.
        Router({ root$el: $(".content"),
                collection: CapstoneProject.indexQuestions});

        Backbone.history.start();

      }

    })
  }
}




$(document).ready(function(){
  CapstoneProject.initialize();
})
