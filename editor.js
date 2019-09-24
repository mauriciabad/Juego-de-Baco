if(!sessionStorage.mode) location.replace("index.html");

var helpDiv = document.getElementById('help-div');
var helpBtn = document.getElementById('help_button');


window.addEventListener('popstate', function(e) {
  if(e.action == 'help'){
    helpDiv.style.transform = 'none';
    helpBtn.style.visibility = 'hidden';
  } else{
    helpDiv.style.transform = 'translateY(-100%)';
    helpBtn.style.visibility = 'visible';
  }
});

function back() {
  // hideUI(function () {
    window.history.back();
  // });
}

function showHelp() {
  helpDiv.style.transform = 'none';
  helpBtn.style.visibility = 'hidden';
  history.pushState({"action":"help"}, "Help", "editor.html");
}

function hideHelp() {
  helpDiv.style.transform = 'translateY(-100%)';
  helpBtn.style.visibility = 'visible';
  window.history.back();
}

function hideUI(callback) {
  document.getElementsByTagName('main')[0].style.opacity = '0';  
  setTimeout(callback, 200)
}