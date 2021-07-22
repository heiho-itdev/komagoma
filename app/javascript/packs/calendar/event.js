import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'
import googleCalendarApi from '@fullcalendar/google-calendar'


document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');
    //カレンダーなしの場合リターン
    if(!calendarEl) return;

    const calendar = new Calendar(calendarEl, {
        plugins: [monthGridPlugin, interactionPlugin, googleCalendarApi],
        //プロパティ
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 1,
        headerToolbar: {
            start: '',
            center: 'title',
            end: 'today prev,next'
        },
        expandRows: true,
        stickyHeaderDates: true,
        buttonText: {
            today: '今日'
        },
        allDayText: '終日',
        height: "auto",

        dateClick: function (info) {
            //日付クリックしたときのイベント
        },
        eventClick: function (info) {
            //表示されたイベントをクリックしたときのイベント
        },
        eventClassNames: function (arg) {
            //表示されたイベントにclassをcss用に追加する
        }

    });
    //カレンダー表示
    calendar.render();

});