(function() {
  var CreateFormView, Schedule, Schedules;

  Schedule = Backbone.Model.extend({
    defaults: {
      title: null,
      datetime: null
    },
    validate: function(attrs) {
      if (!attrs.title) {
        return 'タイトルは必須です';
      }
      if (!attrs.datetime) {
        return '日時は必須です';
      }
      if (!moment.isMoment(attrs.datetime) || !attrs.datetime.isValid()) {
        return '日時の形式が不正です';
      }
    },
    dateFormat: function(f) {
      return this.get('datetime').format(f);
    }
  });

  Schedules = Backbone.Collection.extend({
    model: Schedule,
    findByDate: function(date) {
      var format, target;
      format = 'YYYY-MM-DD';
      target = moment(date).format(format);
      return this.select(function(model) {
        return model.dateFormat(format) === targetDate;
      });
    }
  });

  CreateFormView = Backbone.View.extend({
    events: {
      'submit': 'onSubmit'
    },
    onSubmit: function(e) {
      var datetime, title;
      e.preventDefault;
      title = this.$('input[name="title"]').val();
      datetime = this.$('input[name="datetime"]').val();
      return this.collection.add({
        title: title,
        datetime: moment(datetime)
      }, {
        validate: true
      });
    }
  });

  window.App = {};

  window.App.Schedule = Schedule;

  window.App.Schedules = Schedules;

  window.App.CreateFormView = CreateFormView;

  $(function() {
    var createFormView, schedules;
    schedules = new App.Schedules();
    createFormView = new App.CreateFormView({
      el: '.createForm',
      collection: schedules
    });
    $('.filterForm').submit(function(e) {
      var date, results;
      e.preventDefault();
      date = $('input[name="filterDate"]').val();
      results = schedules.findByDate(date);
      $('.count').html(results.length + '件の予定があります');
      $('.list').empty();
      _.each(results, function(model) {
        var $li;
        return $li = $('<li>').html(model.dateFormat('MM月DD日 HH時mm分') + '：' + model.get('title'));
      });
      return $('.list').append($li);
    });
    schedules.on('add', function(model) {
      var $li;
      $('.count').html(schedules.length + '件の予定があります');
      $li = $('<li>').html(model.dateFormat('MM月DD日 HH時mm分') + '：' + model.get('title'));
      return $('.list').append($li);
    });
    return schedules.on('invalid', function(model, message) {
      return alert(message);
    });
  });

}).call(this);
