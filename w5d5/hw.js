window.setTimeout( function () {
  alert('HAMMERTIME');
}, 5000);

function hammertime(time) {
  setTimeout(function () {
    alert(`${time} is HAMMERTIME`);
  }, 5000);
}

hammertime(5);
