if(!sessionStorage.mode) location.replace("index.html");

var mode = sessionStorage.mode || 'none';
var phraseContainer = document.getElementById('phrase');
var inputPlayers = document.getElementById('players_input');
var phrases = [];
var originalPhrases = [];
var players = JSON.parse(sessionStorage.players || '[]');
var phraseIndex = 0;

if(sessionStorage.players) phraseContainer.textContent = "Comprueva los nombres y toca aquí para continuar";
inputPlayers.value = players.join(' ');
console.log('Players are: '+players.join(', '));

loadPhrases(mode);

window.onkeypress  = function(event) {
  if(event.target != inputPlayers){
    if ([13,32,39,40].includes(event.keyCode)) nextPhrase();
    else if ([8,37,38].includes(event.keyCode)) repeatLastPhrase();
  }
};



function loadPhrases(params) {
  /* To use php, and get phrases from mySQL, 
   * just change the file path to the php file
   * and make shure that the php returns a JSON
   */
  readFile(`modes/${mode}.json`, function(text){
    originalPhrases = JSON.parse(text);
    shuffleArray(originalPhrases);
    phraseIndex = 0;
    phrases = completePhrases(originalPhrases);
  });
}

function completePhrases(original) {
  let modified = [];
  for (const i in original){
    let p1 = randomName();
    let p2 = randomNameNotMe(p1);
    let p3 = randomNameNotUs(p1, p2);
    let p4 = randomNameNotUsThree(p1, p2, p3);
    modified[i] = eval('`'+original[i]+'`');
  }
  return modified;
}

function readFile(file, callback) {
  var rawFile = new XMLHttpRequest();
  rawFile.overrideMimeType("application/json");
  rawFile.open("GET", file, true);
  rawFile.onreadystatechange = function() {
    if (rawFile.readyState === 4 && rawFile.status == "200") {
      callback(rawFile.responseText);
    }
  }
  rawFile.send(null);
}

function playersOK() {
  if (players.length >= 1) {
    return true;
  } else {
    //$('#players').animateCss('shake');
    phraseContainer.textContent = "Escribid vuestros nombres arriba";
    return false;
  }
}

function getPlayers() {
  players = inputPlayers.value.split(/[\s,:.]+/)
  players = players.filter(function (name) {
    return name != "";
  }); //to remove empty names if user writes two consecutive spaces
  for (var i = 0; i < players.length; i++) {
    players[i] = players[i].charAt(0).toUpperCase() + players[i].slice(1);
  }
  inputPlayers.value = players.join(' ');
  sessionStorage.players = JSON.stringify(players);
  console.log('Players are: '+players.join(', '));
  phrases = completePhrases(originalPhrases);
}

function changeMode() {
  hideUI(function () {
    history.back();
    location.replace("index.html");
  });
}

function shuffleArray(array) {
  for (var i = array.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    var temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
  console.log("Array shuffled");
  return array;
}

function nextPhrase() {
  if (playersOK()) {
    if (phraseIndex >= phrases.length) {
      phraseContainer.textContent = "Frases agotadas, toca aquí para cargar más";
      phraseIndex = 0;
      shuffleArray(phrases);
    } else {
      phraseContainer.textContent = phrases[phraseIndex];
      ++phraseIndex;
    }
  }
}

function repeatLastPhrase() {
  if (phraseIndex <= 1) {
    phraseContainer.textContent = "Te has pasado la primera frase, toca a la derecha";
    phraseIndex = 0;
  } else {
    --phraseIndex;
    phraseContainer.textContent = phrases[phraseIndex - 1];
  }
  //$('#phrase').removeClass('fadeIn');
  //$('#phrase').animateCss('rubberBand');
}

function hideUI(callback) {
  document.getElementsByTagName('header')[0].style.transform = 'translateY(-100%)';
  document.getElementsByTagName('main')[0].style.opacity = '0';  
  setTimeout(callback, 750)
}

function number(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

function randomName() {
  if (players.length < 1) {
    return "J1";
  } else {
    var name = players[number(0, players.length - 1)];
    return name;
  }
}

function randomNameNotMe(myName) {
  if (players.length < 2) {
    return "J2";
  } else {
    var name = players[number(0, players.length - 1)];
    if (name !== myName) {
      return name;
    } else {
      return randomNameNotMe(myName);
    }
  }
}

function randomNameNotUs(myName, otherMyName) {
  if (players.length < 3) {
    return "J3";
  } else {
    var name = players[number(0, players.length - 1)];
    if ((name !== myName) && (name !== otherMyName)) {
      return name;
    } else {
      return randomNameNotUs(myName, otherMyName);
    }
  }
}

function randomNameNotUsThree(myName, otherMyName, otherOtherMyName) {
  if (players.length < 4) {
    return "J4";
  } else {
    var name = players[number(0, players.length - 1)];
    if ((name !== myName) && (name !== otherMyName) && (name !== otherOtherMyName)) {
      return name;
    } else {
      return randomNameNotUsThree(myName, otherMyName, otherOtherMyName);
    }
  }
}