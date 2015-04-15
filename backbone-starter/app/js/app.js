(function() {
  var Schedule, Schedules;

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
    model: Schedule
  });

  window.App = {};

  window.App.Schedule = Schedule;

  window.App.Schedules = Schedules;

  $(function() {
    var schedules;
    schedules = new App.Schedules();
    $('.createForm').submit(function(e) {
      var datetime, title;
      e.preventDefault();
      title = $('input[name="title"]').val();
      datetime = $('input[name="datetime"]').val();
      return schedules.add({
        title: title,
        datetime: moment(datetime)
      }, {
        validate: true
      });
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
