document.addEventListener("DOMContentLoaded", function(){

  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');
  // ctx.fillStyle = 'blue';
  // ctx.fillRect(0,0,200,150);

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.lineWidth = 2;
  ctx.strokeStyle = 'red';
  ctx.fillStyle = 'teal';
  ctx.fill();
  ctx.stroke();
});
