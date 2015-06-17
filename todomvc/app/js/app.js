(function() {
  var SouToDoApp;

  SouToDoApp = {
    init: function() {
      var todo, todoView;
      console.log("初期化完了");
      todo = new SouToDoApp.Models.TodoModel({
        task: "ごはん"
      });
      todoView = new SouToDoApp.Views.TodoView({
        model: todo
      });
      console.log(todoView);
      $("body").prepend(todoView.el);
      return window.todoView = todoView;
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

  SouToDoApp.Collections.TodosCollection = Backbone.Collection.extend({
    model: SouToDoApp.Models.TodoModel
  });

  SouToDoApp.Views.TodoView = Backbone.View.extend({
    tagName: "p",
    initialize: function() {
      console.log(this.model.get("task"));
      this.render();
      return this.listenTo(this.model, "change", function() {
        return this.render();
      });
    },
    render: function() {
      return this.$el.text(this.model.get("task"));
    }
  });

  SouToDoApp.init();

}).call(this);
