(function() {
  var CalendarView, CreateFormView, Schedule, Schedules;

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
      e.preventDefault();
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

  CalendarView = Backbone.View.extend({
    initialize: function() {
      this.current = moment();
      return this.render();
    },
    render: function() {
      var $caption, $tbody, $td, $tr, currentDay, endDay, i, results;
      $caption = this.$('caption');
      $tbody = this.$('tbody');
      currentDay = this.current.clone().startOf('month').startOf('week');
      endDay = this.current.clone().endOf('month');
      $tbody.empty();
      $caption.text(this.current.format('YYYY年MM月'));
      results = [];
      while (currentDay <= endDay) {
        $tr = $('<tr>').appendTo($tbody);
        results.push((function() {
          var j, results1;
          results1 = [];
          for (i = j = 0; j < 7; i = ++j) {
            $td = $('<td>').text(currentDay.format('DD')).appendTo($tr);
            results1.push(currentDay.add(1, 'day'));
          }
          return results1;
        })());
      }
      return results;
    },
    toPrev: function() {
      this.current.subtract(1, 'month');
      return this.render();
    },
    toNext: function() {
      this.current.add(1, 'month');
      return this.render();
    },
    toToday: function() {
      this.current = moment();
      return this.render();
    }
  });

  window.App = {};

  window.App.Schedule = Schedule;

  window.App.Schedules = Schedules;

  window.App.CreateFormView = CreateFormView;

  window.App.CalendarView = CalendarView;

  $(function() {
    var calendarView, createFormView, schedules;
    schedules = new App.Schedules();
    createFormView = new App.CreateFormView({
      el: '.createForm',
      collection: schedules
    });
    calendarView = new App.CalendarView({
      el: '.calendar',
      collection: schedules
    });
    $('.calendar-prevBtn').click(function() {
      return calendarView.toPrev();
    });
    $('.calendar-nextBtn').click(function() {
      return calendarView.toNext();
    });
    return $('.calendar-todayBtn').click(function() {
      return calendarView.toToday();
    });
  });

}).call(this);
