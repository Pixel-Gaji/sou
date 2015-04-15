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
    window.schedules = schedules;
    schedules.on('add', function(model) {
      var $p;
      $p = $('<p>').html(model.dateFormat('MM月DD日 HH時mm分') + '：' + model.get('title'));
      return $('body').append($p);
    });
    schedules.on('invalid', function(model, message) {
      return alert('Error: ' + message);
    });
    schedules.add({
      title: '打ち合わせ',
      datetime: moment('2013-10-26 15:00')
    }, {
      validate: true
    });
    schedules.add({
      title: '勉強会',
      datetime: moment('2013-10-27 20:00')
    }, {
      validate: true
    });
    return schedules.add({
      title: 'ラーメン',
      datetime: moment('2013-10-30 20:00')
    }, {
      validate: true
    });
  });

}).call(this);
