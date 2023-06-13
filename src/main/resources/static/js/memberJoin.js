$('#startTime').timepicker({
    timeFormat: 'hh:mm p',
    interval: 30,
    minTime: '7',
    maxTime: '1:00pm',
    defaultTime: '9',
    startTime: '7:00',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});


$('#finishTime').timepicker({
    timeFormat: 'hh:mm p',
    interval: 30,
    defaultTime: '18',
    dynamic: false,
    dropdown: true,
    scrollbar: false
});

