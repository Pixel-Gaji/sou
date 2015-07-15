(function() {
  var SouToDoApp;

  SouToDoApp = {
    init: function() {
      var inputView, todosCollection, todosView;
      todosCollection = new SouToDoApp.Collections.TodosCollection;
      inputView = new SouToDoApp.Views.inputView({
        collection: todosCollection
      });
      return todosView = new SouToDoApp.Views.TodosView({
        collection: todosCollection
      });
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
      var $input, inputTask;
      ev.preventDefault();
      $input = this.$("#new-todo");
      inputTask = $input.val();
      this.collection.add({
        task: inputTask
      });
      return $input.val('');
    }
  });

  SouToDoApp.Views.TodoView = Backbone.View.extend({
    tagName: "li",
    template: _.template("<div class=\"view\">\n	<input class=\"toggle\" type=\"checkbox\">\n	<label><%= taskName %></label>\n	<button class=\"destroy\"></button>\n</div>\n<input class=\"edit\" value=\"Create a TodoMVC template\">"),
    initialize: function() {
      return this.render();
    },
    render: function() {
      return this.$el.html(this.template({
        taskName: this.model.get("task")
      }));
    }
  });

  SouToDoApp.Views.TodosView = Backbone.View.extend({
    tagName: "ul",
    initialize: function() {
      return this.listenTo(this.collection, "add", this.render);
    },
    render: function(todo) {
      var todoView;
      todoView = new SouToDoApp.Views.TodoView({
        model: todo
      });
      return $("#todo-list").prepend(todoView.el);
    }
  });

  SouToDoApp.init();

}).call(this);
