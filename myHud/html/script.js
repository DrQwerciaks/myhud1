
$(document).ready(function(){

  var greenMoneyColor = '#33A532';
  var redMoneyColor = '#DE1738';

  window.addEventListener("message", function(event){
    if (event.data.action == "toggle"){
			if (event.data.show){
				$('#ui').show();
			} else{
				$('#ui').hide();
      }
    }
	  else if (event.data.action == "toggleDrunk"){
			if (event.data.show){
				$('#drunk-ui').show();
			} else{
				$('#drunk-ui').hide();
      }
    }
    else if (event.data.action == "toggleVoice"){
			if (event.data.show){
				$('#voice-ui').show();
			} else{
				$('#voice-ui').hide();
      }
    }
    else if (event.data.action == "toggleMoney"){
			if (event.data.show){
				$('#money').show();
			} else{
				$('#money').hide();
      }
    }
    else if (event.data.action == "toggleHeart"){
			if (event.data.show){
				$('#heart-ui').show();
			} else{
				$('#heart-ui').hide();
      }
    }
    else if (event.data.action == "updateStatus"){
      updateStatus(event.data.status);
    }
    else if (event.data.action == "updateVoicerange") {
      updateVoiceRange(event.data.range)
    }
    else if (event.data.action == "updateHeart") {
      updateHeart(event.data.lives)
    }
    else if (event.data.action == "updateMoney") {
      updateMoney(event.data.money)
    }

  });

  function updateStatus(status){
    var hunger = status[0]
    var thirst = status[1]
    var drunk = status[2]
    setProgress(hunger.percent * 1.3,'.progress-hunger');
    setProgress(thirst.percent * 1.3,'.progress-thirst');
    setProgress(drunk.percent * 1.3,'.progress-drunk');
  }
  
  function updateVoiceRange(range){
	  setProgress(range * 1.3, '.progress-voice')
  }

  function updateHeart(lives){
    var finalLives = lives * 1.3
    setProgress(finalLives, '.progress-heart')
  }
  
  function updateMoney(money) {
    var currentMoney = '$' + money + '';
    document.getElementById('money').innerHTML = [currentMoney];
    if (money < 0) {
      $('#money').css('background-color', redMoneyColor)
    } else {
      $('#money').css('background-color', greenMoneyColor)
    }
  }

  function setProgress(percent, element){
    $(element).width(percent);
  }

  // function updateBlackMoney(money) {
  //   var currentMoney = money + '$';
  //   document.getElementById('black-money').innerHTML = [currentMoney];
  // }

});
