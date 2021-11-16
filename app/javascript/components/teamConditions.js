// Guidelines and error messages for the required # of players
const playersConstraint = () => {
  const players = document.querySelectorAll('.clickable');

  const updateRemainers = () => {
    let remaining_players = 5;
    let remaining_constructors = 1;
    let total_constructor_chosen = 0;
    let total_player_chosen = 0;
    for (let index = 0; index < players.length; index++) {
      if (players[index].classList.contains('active') && players[index].querySelectorAll('.constructor')[0].innerText == 'true') {
        remaining_constructors = 0;
        total_constructor_chosen += 1;
      } else if (players[index].classList.contains('active') && players[index].querySelectorAll('.constructor')[0].innerText == 'false' && remaining_players > 0) {
        remaining_players -= 1;
        total_player_chosen += 1;
      } else if (players[index].classList.contains('active') && players[index].querySelectorAll('.constructor')[0].innerText == 'false' && remaining_players <= 0) {
        total_player_chosen += 1;
      }

      document.querySelector('.remaining-constructor').innerText = remaining_constructors.toString();
      document.querySelector('.remaining-players').innerText = remaining_players.toString();
    }

    if (total_constructor_chosen > 1) {
      document.querySelector('.error-constructors').innerText = "You picked too many constructors.";
    } else {
      document.querySelector('.error-constructors').innerText = "";
    }

    if (total_player_chosen > 5) {
      document.querySelector('.error-players').innerText = "You picked too many players.";
    } else {
      document.querySelector('.error-players').innerText = "";
    }
  }

  const updateRemainersOnClick = (player) => {
    player.addEventListener('click', updateRemainers);
  };

  players.forEach(updateRemainersOnClick);
}

// Displaying the save button when the conditions are met
const displayTeamSave = () => {

}

export { playersConstraint, displayTeamSave }
