// Add a player to the selection when clicked
const clickListener = () => {
  const players = document.querySelectorAll('.clickable');

  const toggleActiveClass = (event) => {
    event.currentTarget.classList.toggle('active');
  };

  const toggleActiveOnClick = (player) => {
    player.addEventListener('click', toggleActiveClass);
  };

  players.forEach(toggleActiveOnClick);
}

// Compute the remaining budget when a new player is selected
const remainingBudget = () => {
  const players = document.querySelectorAll('.clickable');
  const substractValue = (event) => {
    let remaining_budget = 200;
    for (let index = 0; index < players.length; index++) {
      if (players[index].classList.contains('active')) {
        remaining_budget -= parseFloat(players[index].querySelector('.price').innerText);
      }
    }
    document.querySelectorAll('.remaining-buget')[0].innerText = remaining_budget.toString();
  }

  const substractOnClick = (player) => {
    player.addEventListener('click', substractValue);
  };

  players.forEach(substractOnClick);
}

export { clickListener, remainingBudget }
