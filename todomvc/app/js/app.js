(function() {
  var SouToDoApp;

  SouToDoApp = {
    init: function() {
      var todos;
      console.log("初期化完了");
      todos = new SouToDoApp.Models.TodoModel;
      return console.log(todos);
    },
    Models: {},
    Collections: {},
    Views: {}
  };

  SouToDoApp.Models.TodoModel = Backbone.Model.extend({
    defaults: {
      task: null
    }
  });

  SouToDoApp.init();

}).call(this);
