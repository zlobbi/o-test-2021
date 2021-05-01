$(document).ready(function () {
    // Calendar defaults
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek'
        },
        selectable: true,

        select: (start, end) => {
            fastView(start, end);
            getSelectedDayEvents(start, end);
        },

        defaultDate: new Date(),
        navLinks: false, // can click day/week names to navigate views
        editable: false,
        eventLimit: true, // allow "more" link when too many event

        // locale
        isRTL: false,
        firstDay: 0,
        monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн', 'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
        dayNames: ['Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'],
        dayNamesShort: ['Вос', 'Пон', 'Вт', 'Ср', 'Чт', 'Пят', 'Суб'],
        buttonText: {
            today: 'Сегодня',
            month: 'Месяц',
            week: 'Неделя',
            day: 'День'
        }
    });

    const taskTypes = document.querySelectorAll('.type-btn');

    taskTypes.forEach(b => b.addEventListener('click', () => {
        if (b.classList.contains('active')) {
            b.classList.remove('active');
        } else {
            taskTypes.forEach(b => b.classList.remove('active'));
            b.classList.add('active');
            b.style.background = 'red';
        }
    }));

    const eventSource = fetch("/api/event/all")
        .then((response) => response.json())
        .then((events) => {
            return events;
        });

    async function fetchAndRenderEvents() {
        const events = await eventSource;
        $('#calendar').fullCalendar('addEventSource', events);
    };

    fetchAndRenderEvents();

    function fastView(start, end) {
        var mTitle = document.querySelector('#day-title-text'),
            endInput = document.querySelector('#end'),
            startInput = document.querySelector('#start'),
            diff = diffBetweenStringDates(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD')),
            dayTitle = diff === 1 ? start.format('ddd DD-MM-YYYY') :
                start.format('ddd DD-MM-YYYY') + ' / ' + end.format('ddd DD-MM-YYYY');
        startInput.value = start.format('YYYY-MM-DD HH:mm:ss');
        endInput.value = end.format('YYYY-MM-DD HH:mm:ss');
        $('#non-selected-hidden-block').removeClass('hidden');
        mTitle.innerHTML = dayTitle;
    }

    function diffBetweenStringDates(first, second) {
        first = new Date(first);
        second = new Date(second);
        return Math.abs(Math.round((second - first) / (1000 * 60 * 60 * 24)));
    }

    function getDateTimeFormat(dateObject) {
        return dateObject.format('YYYY-MM-DD HH:mm:ss');
    }

    async function getSelectedDayEvents(start, end) {
        const data = {
            "start": getDateTimeFormat(start),
            "end": getDateTimeFormat(end)
        };
        await postData('api/event/selected-day', JSON.stringify(data))
            .then(data => {
                const listBlock = document.querySelector('#tasks-list .list-group');
                listBlock.innerHTML = '';
                JSON.parse(JSON.stringify(data)).forEach(e => {
                    renderInTaskList(e, listBlock);
                });
            });
    }

    const postData = async (url, data) => {
        const res = await fetch(url, {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            },
            body: data
        });
        return await res.json();
    };

    function renderInTaskList(event, listBlock) {
        const item = document.createElement('a'),
            badge = document.createElement('span');
        item.classList.add('list-group-item', 'list-group-item-action', `list-group-item-${event.bgColor}`);
        item.cssText = {
            'background-color': event.color
        };
        item.innerText = event.title;
        badge.classList.add('badge', 'badge-pill', `badge-${event.bgColor}`);
        item.append(badge);
        listBlock.append(item);
    }
});

class Event {
    constructor(id, title, descr, start, end, type) {
        this.id = id;
        this.title = title;
        this.descr = descr;
        this.start = start;
        this.end = end;
        this.type = type;
    }
}
