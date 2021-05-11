document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title');

  if (control)  control.addEventListener('click', sortByTitle);
})

function sortByTitle() {
  const table = document.querySelector('table');

  const rows = table.querySelectorAll('tr');

  const sortedRows = Array.from(rows);

  sortedRows.shift();

  if ( table.querySelector('.octicon-triangle-up').classList.contains('hide') ) {
    sortedRows.sort(compareRowsAsc);

    table.querySelector('.octicon-triangle-up').classList.remove('hide');
    table.querySelector('.octicon-triangle-down').classList.add('hide');

  } else {
    sortedRows.sort(compareRowsDesc);

    table.querySelector('.octicon-triangle-down').classList.remove('hide');
    table.querySelector('.octicon-triangle-up').classList.add('hide');
  }

  table.tBodies[0].append(...sortedRows);
}

function compareRowsAsc(row1, row2) {
  if (row1.cells[0].textContent < row2.cells[0].textContent) return -1;
  if (row1.cells[0].textContent > row2.cells[0].textContent) return  1;

  return 0;
}

function compareRowsDesc(row1, row2) {
  if (row1.cells[0].textContent < row2.cells[0].textContent) return  1;
  if (row1.cells[0].textContent > row2.cells[0].textContent) return -1;

  return 0;
}
