(function() {
  var SouToDoApp;

  SouToDoApp = {
    init: function() {
      var inputView, todo, todosCollection, todosView;
      todosCollection = new SouToDoApp.Collections.TodosCollection;
      inputView = new SouToDoApp.Views.inputView({
        collection: todosCollection
      });
      todo = new SouToDoApp.Models.TodoModel({
        task: "タスク"
      });
      todosView = new SouToDoApp.Views.TodosView({
        collection: todosCollection
      });
      window.todoView = todoView;
      return $("body").prepend(todoView.el);
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

  SouToDoApp.Views.inputView = Backbone.View.extend({
    el: "#inputForm",
    events: {
      "submit": "testSubmit"
    },
    initialize: function() {},
    testSubmit: function(ev) {
      var inputTask;
      ev.preventDefault();
      inputTask = this.$("#new-todo").val();
      this.collection.add({
        task: inputTask
      });
      return console.log(this.collection);
    }
  });

  SouToDoApp.Views.TodoView = Backbone.View.extend({
    tagName: "li",
    initialize: function() {
      return this.render();
    },
    render: function() {
      return this.$el.text(this.model.get("task"));
    }
  });

  SouToDoApp.Views.TodosView = Backbone.View.extend({
    tagName: "ul",
    initialize: function() {
      this.render();
      console.log(this.collection);
      return this.listenTo(this.collection, "add", (function(_this) {
        return function() {
          return _this.render();
        };
      })(this));
    },
    render: function() {
      var todoView;
      return todoView = new SouToDoApp.Views.TodoView({
        model: this.collection
      });
    }
  });

  SouToDoApp.init();

}).call(this);
