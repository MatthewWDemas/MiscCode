function getTimeRemaining(endtime) {
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor((t / 1000) % 60);
  var minutes = Math.floor((t / 1000 / 60) % 60);
  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
  var days = Math.floor(t / (1000 * 60 * 60 * 24));
  return {
    'total': t,
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime) {
  var clock = document.getElementById(id);
  var daysSpan = clock.querySelector('.days');
  var hoursSpan = clock.querySelector('.hours');
  var minutesSpan = clock.querySelector('.minutes');
  var secondsSpan = clock.querySelector('.seconds');

  function updateClock() {
    var t = getTimeRemaining(endtime);

    daysSpan.innerHTML = t.days;
    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

    if (t.total <= 0) {
      clearInterval(timeinterval);
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}

//var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
var deadline = new Date(Date.parse(new Date()) + 6.25 * 60 * 60 * 1000);
initializeClock('clockdiv', deadline);

//TODO: Allow for a date picker to set the dealine for a given timer.
//TODO: Allow for multiple divs to be created with different deadlines.
//TODO: Ensure that this has a memory. Maybe with SQLITE or external text file.
//TODO: A separate timer for the week displaying working hours that only progresses between working hours. You have XX hours of working left this week.
//TODO: A separate timer for project deadlines. You have XX hours left allocated to this project based on projections for amount of time per day/week/month.
//TODO: A separate timer for weekly project progression. Based on estimates/proposals for time to spend on a given project in a week/month/day.
