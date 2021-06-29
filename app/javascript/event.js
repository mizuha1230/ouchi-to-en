import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid'

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin, interactionPlugin ],

      locale: 'ja',
      timeZone: 'Asia/Tokyo',
      firstDay: 1,
      headerToolbar: {
        start: '',
        center: 'title',
        end: 'prev,next' 
      },
      expandRows: true,
      stickyHeaderDates: true,
      height: "auto",
      events: '/events.json', 

      dateClick: function(info){
              const year  = info.date.getFullYear();
              const month = (info.date.getMonth() + 1);
              const day   = info.date.getDate();

              $.ajax({
                  type: 'GET',
                  url:  '/events/new',
              }).done(function (res) {
                  $('.modal-body').html(res);
                  $('#event_start_1i').val(year);
                  $('#event_start_2i').val(month);
                  $('#event_start_3i').val(day);
  
                  $('#event_end_1i').val(year);
                  $('#event_end_2i').val(month);
                  $('#event_end_3i').val(day);
                  $('#modal').modal();
  
              }).fail(function (result) {
                  alert("failed");
              });
          },
  });

  calendar.render();

});
