

function draw() {
  var ctx = document.getElementById('canvas').getContext('2d');
  ctx.globalCompositeOperation = 'destination-over';
  ctx.clearRect(0, 0, 500, 500);
  ctx.fillStyle = 'rgba(0, 0, 0, 0.4)';
  ctx.strokeStyle = 'rgba(0, 153, 255, 0.4)';

  let time = new Date();
  let trans = time.getSeconds();
  ctx.save();

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.stroke();
  setTimeout(function () {
  }, 10000);
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
  ctx.stroke();
  setTimeout(function () {
  }, 10000);
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
  ctx.stroke();
  setTimeout(function () {
  }, 10000);
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
  ctx.stroke();

  window.requestAnimationFrame();
}

draw();
