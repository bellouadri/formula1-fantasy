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

export { clickListener }
