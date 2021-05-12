document.addEventListener('turbolinks:load', () => {
  const bar = document.getElementById('test-progress');

  if (bar) {
    bar.value = bar.dataset.currentVal - 1;
    bar.max   = bar.dataset.total;
  }
})
