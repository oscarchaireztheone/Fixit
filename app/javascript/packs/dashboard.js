import { noteIconCheck, appendNoteForm } from './boiler.js';
import * as callViews from  './callviews.js';
import * as bA from './buttonActions.js';
 document.addEventListener('DOMContentLoaded', () => {
  // Add event listeners to each dropdown item
  noteIconCheck();
    document.getElementById('viewAll').addEventListener('click', function() {
    sendApiRequest('view_all');
  });

  document.getElementById('viewOpen').addEventListener('click', function() {
    sendApiRequest('view_open');
  });

  document.getElementById('viewSync').addEventListener('click', function() {
    sendApiRequest('view_sync');
  });

  document.getElementById('viewByTech').addEventListener('click', function() {
    sendApiRequest('view_by_tech');
  });

  document.getElementById('viewNotScheduled').addEventListener('click', function() {
    sendApiRequest('view_not_scheduled');
  });

// Function to send API request
function sendApiRequest(action) {
  event.preventDefault();
  fetch('/api/service_manager/' + action, {
    method: 'GET', // or 'POST'
    headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer ' + token  // if you use token-based authentication
    },
  })
  .then(response => response.json())
  .then(data => {
    console.log(data); // Output data to console for now
    // If action is view_all, call a specific function to handle this
    if (action === 'view_all') {
      handleViewAll(data);
    } else if (action === 'view_open') {
      handleViewOpen(data);
    } else if (action === 'view_sync') {
      handleViewSync(data);
    } else if (action === 'view_by_tech') {
      handleViewTech(data);
    } else if (action === 'view_not_scheduled') {
      handleViewNotScheduled(data);
    }
  })
  .catch((error) => {
    console.error('Error:', error);
  });
  }
});

function handleViewAll(data) {
  var container = document.getElementById('data-container');
  container.innerHTML = '';
  data.forEach(item => {
    // Create a new div element and fill it with the item data
    createCallItem(item, container);
  });
}
function handleViewNotScheduled(data) {
  var container = document.getElementById('data-container');
  container.innerHTML = '';
  data.forEach(item => {
    // Create a new div element and fill it with the item data
    createCallItem(item, container);
  });
}

export function handleViewOpen(data) {
  var container = document.getElementById('data-container');
  container.innerHTML = '';
  data.forEach(item => {
    // Create a new div element and fill it with the item data
    createCallItem(item, container);
  });
}
function handleViewSync(data) {
  var container = document.getElementById('data-container');
  container.innerHTML = '';
  data.forEach(item => {
    // Create a new div element and fill it with the item data
    createCallItem(item, container);
  });
}
function get_schedule(data, container) {
    data.sort((a, b) => new Date(a.date) - new Date(b.date));
    let select = document.createElement('select');
    select.onchange = function() {
      let selectedId = this.value;
      fetch(`/api/service_manager/get_day?id=${selectedId}`)
        .then(response => response.json())
        .then(day => {
          displayData(day, container)
        })
        .catch(error => console.error(error));
    };
    // Add an option for each date
    for (let day of data) {
      let option = document.createElement('option');
      option.value = day.id;  // Use the ID as the option value
      option.text = day.date;
      select.appendChild(option);
      container.appendChild(select);
    }
  } 


function handleViewTech(data) {
  var container = document.getElementById('data-container');
  container.innerHTML = '';
  get_schedule(data, container);
}
function viewDetails(id) {
  // Do something when the view button is clicked, e.g., navigate to the details page
  window.location.href = '/api/service_manager/details/' + id;
}
function displayData(data, containerBase) {
  // Convert the date to a string
  function formatDate(dateStr) {
  let date = new Date(dateStr);
  let options = { timeZone: 'America/Los_Angeles', year: 'numeric', month: '2-digit', day: '2-digit' };
  return date.toLocaleDateString('en-US', options);
  }

  let dateStr = data.date;
  console.log("***DATE********")
  console.log(dateStr)
  // Check if the container already exists
  let container = document.getElementById('dayContainer');
  if (!container) {
    // If it doesn't exist, create it
    container = document.createElement('div');
    container.id = 'dayContainer';
    document.body.appendChild(container);
  } else {
    // If it does exist, clear it
    container.innerHTML = '';
  }
  console.log("****************")
  console.log(dateStr)
  // Create an element for the date and add it to the container
  let dateElem = document.createElement('h2');
  dateElem.textContent = dateStr;
  container.appendChild(dateElem);

  // Create the alert boxes
  for (let i = 1; i <= 8; i++) {
    let alertBox = document.createElement('div');
    alertBox.className = 'alert alert-success';

    let slotData = data['slot' + i];
    if (slotData) {
      // If there's data for this slot, display it in the alert box
      alertBox.textContent = JSON.stringify(slotData, null, 2);
    } else {
      // If there's no data for this slot, display 'Empty'
      alertBox.textContent = 'Empty';
    }

    // Add the alert box to the container
    container.appendChild(alertBox);
  }
  containerBase.appendChild(container);
}


function createCallItem(item, container) {
    const ul = document.createElement('ul');
    ul.className = 'list-group';
    ul.innerHTML = `
    <li class="list-group-item">
      <p>Name: ${item.name}--Phone1: ${item.phone1} Schedule Date: ${item.day_id}<-</p>
      <p>Fourk: ${item.fourk}--Phone2: ${item.phone2} STATUS: ${item.status}</p>
      <p>ID:${item.id}--Address: ${item.address}</p>
    </li>
    `;

      const viewBtn = document.createElement('button');
      viewBtn.className = 'btn btn-primary';
      viewBtn.innerText = 'View';
      viewBtn.addEventListener('click', function() {
      fetch(`/api/service_manager/modal?id=${item.id}`)
      .then(response => response.json())
      .then(data => {
        let modal = document.getElementById("myModal");
        let span = document.getElementById("closeModalButton");
        let modal_icon = document.getElementById("modalNoteIcon");
        let note_holder = document.createElement('div');
        let allNotesIcon = document.getElementById('allNotestIcon');
        let notesDisplayed = false;

        modal.appendChild(note_holder); // Use appendChild instead of insertAdjacentHTML
        modal.style.display = "block";
        console.log(data);
        callViews.updateModalContent(data.samsungcall);

        modal_icon.onclick = function() { 
          appendNoteForm(note_holder, 'note-form-modal', 'block'); // pass an ID when calling the function
          const modal_note_form = modal.querySelector('#note-form-modal');
        }
        span.onclick = function() {
          modal.style.display = "none";
        }
        allNotesIcon.onclick = function(){
          if(notesDisplayed) {
            // If notes are displayed, remove them
            note_holder.innerHTML = "";
            notesDisplayed = false;
          } else {
            // If notes are not displayed, display them
            callViews.displayNotes(data.notes, note_holder);
            notesDisplayed = true;
          }
        }
    });
});

  ul.appendChild(viewBtn);
  container.appendChild(ul);
}


