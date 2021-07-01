function loadYouTube(e = null) {
  if (e == null) return;
  var i = e.target.getAttribute('data-videoid');
  d.getElementById(i).innerHTML = d.getElementById('yt-' + i).innerHTML
}

$('.youtube a:last-child').on('click', loadYouTube);
