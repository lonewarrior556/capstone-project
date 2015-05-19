window.CapstoneProject = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function(){
    $(".no-login").attr("id","");
    $("a, button").not( document.getElementById("log-out")).on("click", function(){
      event.preventDefault()
      event.stopPropagation();
      var hash = event.currentTarget.href.slice(7)
      var index = hash.indexOf("/")
      hash = hash.slice(index)
      console.log(hash)
      Backbone.history.navigate(hash, {trigger: true})
    });

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
