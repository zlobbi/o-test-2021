$(document).ready(function () {
    const eventModal = document.querySelector('.modal'),
        calendar = document.querySelector('#calendar'),
        brand = document.querySelector('.header'),
        modalCloseBtn = document.querySelector('[data-close]'),
        searchInput = document.querySelector('#search-div input'),
        searchResult = document.querySelector('#search-result');

    searchInput.addEventListener('focus', () => {
        calendar.classList.remove('show');
        calendar.classList.add('hidden');
        searchResult.style.display = 'flex';
    });

    brand.addEventListener('click', () => {
        calendar.classList.remove('hidden')
        calendar.classList.add('show');
        searchResult.style.display = 'none';
    });

    modalCloseBtn.addEventListener('click', () => {
        closeModal();
    });

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today myCustomButton',
            center: 'title',
            right: 'month,basicWeek'
        },
        selectable: true,

        select: (start, end) => {
            openModal(start, end);
        },

        defaultDate: new Date(),
        navLinks: false, // can click day/week names to navigate views
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: [
            {
                title: 'All Day Event',
                start: '2021-04-24',
                editable: true,
                display: 'list-item'
            },
            {
                title: 'Long Event',
                start: '2021-04-24',
                end: '2021-04-27',
                editable: true,
                display: 'list-item',
                finished: false
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2021-04-24',
                editable: true,
                display: 'background',
                backgroundColor: ''
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2021-04-24',
                editable: true,
                display: 'list-item'
            }
        ]
    });

    function closeModal() {
        eventModal.style.display = 'none';
        document.body.style.overflow = '';
    }

    function openModal(start, end) {
        var mTitle = eventModal.querySelector('.modal__title');
        mTitle.innerHTML = start.format('ddd DD-MM-YYYY') + '<br>' + end.format('ddd DD-MM-YYYY');
        eventModal.style.display = 'block';
        document.body.style.overflow = 'hidden';
    }
});
