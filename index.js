if (navigator.share) {
  document.getElementById('share-button').hidden = false;
}


function selectTopic(mode){
  sessionStorage.mode = mode;
  hideUI(function () {
    window.location.href = 'playing.html';
  });
}

function hideUI(callback) {
  document.getElementsByTagName('main')[0].style.opacity = '0';  
  setTimeout(callback, 200)
}

function share() {
  if (navigator.share) {
    navigator.share({
      title: 'El Juego de Baco',
      text: 'Diviértete con tus amigos y conócelos a fondo 😏',
      url: 'https://www.mauriciabad.com/juego-de-baco',
    }).then(() => console.log('Successful share')).catch((error) => console.log('Error sharing', error));
  }
}