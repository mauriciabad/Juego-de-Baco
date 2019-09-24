if(!sessionStorage.mode) location.replace("index.html");

var mode = sessionStorage.mode || null;
var phrases = [];
var players = JSON.parse(sessionStorage.players || '[]');
var phraseIndex = -1;

var phraseContainer = document.getElementById('phrase');
var inputPlayers    = document.getElementById('players_input');
var upVotesText     = document.getElementById('up_vote_text');
var downVotesText   = document.getElementById('down_vote_text');

if(sessionStorage.players) phraseContainer.textContent = "Comprueva los nombres y toca aquí para continuar";
inputPlayers.value = players.join(' ');
console.log('Players are: '+players.join(', '));

document.title = 'Jugando '+mode;

loadPhrases(false,-1);

window.onkeypress  = function(event) {
  if(event.target != inputPlayers){
    if ([13,32,39,40].includes(event.keyCode)) nextPhrase();
    else if ([8,37,38].includes(event.keyCode)) repeatLastPhrase();
  }
};

function uploadPhrases() {
  for (let i = 1; i <= 7; i++) {
    request('modes/'+i+'.json',null,'GET',function (response) {
      for (const j in response) {
        addPhrase(i,response[j],5);
      }
    });
  }
}

function numPlayers(phrase) {
  let i=1;
  while(RegExp('\\$\\{\\s*p\\[\\s*'+i+'\\s*\\][\\s;]*\\}').test(phrase)) ++i;
  return --i;
}

function loadPhrases(show=false,i=0) {
  let data = {"players": players.length, "amount": 100, "mode": mode, "dificultyMin": 0, "dificultyMax": 5};
  // there shoud be an offline option
  request('actions/getPhrases.php', data, 'GET', function(response){
    phrases = response;
    phraseIndex = i;
    phrases = completePhrases(phrases);
    if (show) {
      showPhrase(phrases[phraseIndex].filledPhrase,'reload');
      updateVotes();
    }
  });
}

function completePhrases(original) {
  for (const i in original){
    let p = shuffleArray(players);
    original[i].filledPhrase = eval('`'+original[i].phrase+'`');
  }
  return original;
}

function request(url, data, method, callback) {
  var xhttp = new XMLHttpRequest();
  xhttp.overrideMimeType('application/json');
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      let response = {};
      try{
        response = JSON.parse(xhttp.responseText)
      }catch(e){
        response = {"error": 'Unable to parse this response: \n'+xhttp.responseText};
      }
      if (response.error != undefined) {
        console.error(response.error);
      }else{
        callback(response);
      }
    }
  }

  if(method == 'GET'){
    xhttp.open('GET', url+'?'+urlQueryEncode(data), true);
    xhttp.send();
  }
  else if(method == 'POST'){
    xhttp.open('POST', url, true);
    xhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(urlQueryEncode(data));
  }
}

function urlQueryEncode(data={}) {  
  return (data === null) ? '' : Object.keys(data)
  .map(k => encodeURIComponent(k) + '=' + encodeURIComponent(data[k]))
  .join('&');
}

function playersOK() {
  if (players.length >= 1) {
    return true;
  } else {
    animate(inputPlayers, 'shake 1s');
    phraseContainer.textContent  = "Escribid vuestros nombres arriba";
    return false;
  }
}

function animate(elem,animation) {
  elem.style.animation = 'none';
  void elem.offsetWidth; //without this the animation doesn't restart
  elem.style.animation = animation;
}

function getPlayers() {
  let oldPlayersLength = players.length;
  players = inputPlayers.value.split(/[\s,:.]+/)
  players = players.filter(name => name != ""); //to remove empty names if user writes two consecutive spaces
  for (var i = 0; i < players.length; i++) {
    players[i] = players[i].charAt(0).toUpperCase() + players[i].slice(1);
  }
  inputPlayers.value = players.join(' ');
  sessionStorage.players = JSON.stringify(players);
  console.log('Players are: '+players.join(', '));
  if(oldPlayersLength != players.length) loadPhrases();
  else phrases = completePhrases(phrases);
}

function changeMode() {
  hideUI(function () {
    history.back();
    location.replace("index.html");
  });
}

function shuffleArray(array, array2) {
  let temp = array[0];
  for (let i = array.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * (i + 1));
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
    if(array2 != undefined && i <= array2.length) {
      temp = array2[i];
      array2[i] = array2[j];
      array2[j] = temp;
    }
  }
  return array;
}

function nextPhrase() {
  if (playersOK()) {
    if (phraseIndex > phrases.length-1) {
      loadPhrases(true);
    } else {
      ++phraseIndex;
      showPhrase(phrases[phraseIndex].filledPhrase,'next');
      updateVotes();
    }
  } else{
    inputPlayers.focus();
  }
}

function repeatLastPhrase() {
  if (phraseIndex <= 0) {
    phraseIndex = -1;
    showPhrase("Te has pasado la primera frase, toca a la derecha",'error');
    hideVotes();
  } else {
    --phraseIndex;
    showPhrase(phrases[phraseIndex].filledPhrase,'prev');
    updateVotes();
  }
}

function showPhrase(text, animation) {
  switch (animation) {
    default:
    case 'next':
      animate(phraseContainer,'nextPhrase 200ms');
      setTimeout(() => {phraseContainer.textContent = text;}, 100);
      break;
    case 'prev':
      animate(phraseContainer,'nextPhrase 200ms reverse');
      setTimeout(() => {phraseContainer.textContent = text;}, 100);
      break;
    case 'error':
      animate(phraseContainer,'errorPhrase 200ms');
      setTimeout(() => {phraseContainer.textContent = text;}, 100);
      break;
    case 'reload':
      animate(phraseContainer,'reloadPhrase 200ms');
      setTimeout(() => {phraseContainer.textContent = text;}, 100);
      break;
  }
}

function hideUI(callback) {
  document.getElementById('down_vote_button').style.transform = 'translateY(100%)';
  document.getElementById('up_vote_button').style.transform = 'translateY(100%)';
  document.getElementsByTagName('main')[0].style.opacity = '0';  
  setTimeout(callback, 200)
}

function random(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

function vote(id,vote){
  let data = {"id": id, "vote": vote};
  request('actions/vote.php', data, 'GET', function(response){
    let i = getPhraseIndex(id);
    if(response.status == "OK"){
      if(vote >= 1) {
        ++phrases[i].upvotes;
        if (response.unvoted) --phrases[i].downvotes;
      }
      else {
        ++phrases[i].downvotes;
        if (response.unvoted) --phrases[i].upvotes;
      }
      updateVotes();
      console.log("Votes:", '-'+phrases[i].downvotes, '+'+phrases[i].upvotes);
    }else{
      console.log("Votes:", '-'+phrases[i].downvotes, '+'+phrases[i].upvotes, response.status);
    }
  });
}

function addPhrase(mode, phrase, dificulty) {
  let data = {"mode": mode, "phrase": phrase, "dificulty": dificulty};
  request('actions/addPhrase.php', data, 'POST', function(response){
    console.log(response);
    
  });
}

function getPhraseIndex(id) {
  return phrases.findIndex(x => x.id == id);
}

function openEditor() {
  hideUI(function () {
    window.location.href = 'editor.html';
  });
}

function updateVotes() {
  upVotesText.textContent   = phrases[phraseIndex].upvotes == 0 ? '' : phrases[phraseIndex].upvotes;
  downVotesText.textContent = phrases[phraseIndex].downvotes == 0 ? '' : phrases[phraseIndex].downvotes;
  showVotes();
}

function hideVotes() {
  upVotesText.parentElement.style.transform = 'translateY(100%)';
  upVotesText.parentElement.style.opacity   = '0';
  downVotesText.parentElement.style.transform = 'translateY(100%)';
  downVotesText.parentElement.style.opacity   = '0';
  upVotesText.textContent   = '';
  downVotesText.textContent = '';
}

function showVotes() {
  // upVotesText.parentElement.style.display   = 'block';
  // downVotesText.parentElement.style.display = 'block';
  upVotesText.parentElement.style.transform = 'none';
  upVotesText.parentElement.style.opacity   = '1';
  downVotesText.parentElement.style.transform = 'none';
  downVotesText.parentElement.style.opacity   = '1';
}