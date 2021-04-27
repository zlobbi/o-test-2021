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

    const newTaskAddBtn = document.querySelector('#new-task-btn'),
        newTask = document.querySelector('#new-task'),
        newTaskForm = document.querySelector('#new-task-form'),
        newTaskFormSubmitBtn = document.querySelector('#new-task-form-submit-btn'),
        newTaskFormRejectBtn = document.querySelector('#new-task-form-reject-btn');

    newTaskFormRejectBtn.addEventListener('click', () => {
        newTaskForm.reset();
        newTaskAddBtn.classList.remove('hidden');
        newTask.classList.add('hidden');
    });

    newTaskAddBtn.addEventListener('click', () => {
        newTaskAddBtn.classList.add('hidden');
        newTask.classList.remove('hidden');
    });

    const eventSource = fetch("/api/task/events")
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
            diff = diffBetweenStringDates(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD')),
            dayTitle = diff == 1 ? start.format('ddd DD-MM-YYYY') :
                start.format('ddd DD-MM-YYYY') + ' / ' + end.format('ddd DD-MM-YYYY');
        $('#non-selected-hidden-block').removeClass('hidden');
        $('#day-title-text').removeClass('text-warning').addClass('text_title');
        mTitle.innerHTML = dayTitle;
    }

    function diffBetweenStringDates(first, second) {
        first = new Date(first);
        second = new Date(second);
        return Math.abs(Math.round((second - first) / (1000 * 60 * 60 * 24)));
    }

    $('.ui.sidebar').sidebar({
        context: $('.pushable.segment'),
        transition: 'overlay'
    }).sidebar('attach events', 'a#hamburger-link');
});
