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
        eventLimit: true, // allow "more" link when too many events
        events: [
            {
                id: 1,
                title: 'All Day Event',
                start: '2021-04-24',
                editable: true
            }
        ],
    });

    const calendar = document.querySelector('#calendar'),
        brand = document.querySelector('.header'),
        searchInput = document.querySelector('#search-div input'),
        searchResult = document.querySelector('#search-result'),
        newTaskAddBtn = document.querySelector('#new-task-btn'),
        newTask = document.querySelector('#new-task'),
        newTaskForm = document.querySelector('#new-task-form'),
        newTaskFormSubmitBtn = document.querySelector('#new-task-form-submint-btn'),
        newTaskFromRejectBtn = document.querySelector('#new-task-form-reject-btn');

    newTaskFromRejectBtn.addEventListener('click', () => {
        newTaskForm.reset();
        newTaskAddBtn.classList.remove('hidden');
        newTask.classList.add('hidden');
    });

    newTaskAddBtn.addEventListener('click', () => {
        newTaskAddBtn.classList.add('hidden');
        newTask.classList.remove('hidden');
    });

    searchInput.addEventListener('focus', () => {
        calendar.classList.remove('show');
        calendar.classList.add('hidden');
        searchResult.style.display = 'flex';
    });

    brand.addEventListener('click', () => {
        calendar.classList.remove('hidden');
        calendar.classList.add('show');
        searchResult.style.display = 'none';
    });

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

});
