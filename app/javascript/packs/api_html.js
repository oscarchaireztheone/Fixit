import { noteIconCheck } from './boiler.js';
 
document.addEventListener('DOMContentLoaded', () => {
  var buttonSubmit = document.getElementById('appointment-sumit-button');
  var buttonReschedule = document.getElementById('portal-reschedule-button');
  if (buttonSubmit) {
    buttonSubmit.addEventListener('click', saveAppointment);
  } else {
    buttonReschedule.addEventListener('click', AlertFeatureComingSoon);
  }
  noteIconCheck();
});
function AlertFeatureComingSoon() {
  alert("Feature coming soon: Call 503-782-8100 Please");
}
async function saveAppointment() {

  const url = 'api/service_manager/make_appointment';
  const sc_id = document.getElementById('sc').value
  const selectedRadioButton = document.querySelectorAll('input[type="radio"]:checked');

  const data = {
      day_date: selectedRadioButton[0].id,
      samsungCall_id: sc_id,
      slot: selectedRadioButton[0].value
  };

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    });

    if (response.ok) {
      location.reload();
    } else {
      console.error('Request failed with status', response.status);
    }
  } catch (error) {
    console.error('Request error:', error);
  }
}
function appendNoteForm() {
  // Create the form HTML string
  let formHTML = `
    <div id="note-form" style="display: none;">
      <form id="new-note-form">
        <label for="note_content">Note Content:</label>
        <textarea id="note_content" name="note_content"></textarea>

        <label for="status">Status:</label>
        <input type="text" id="status" name="status">

        <button type="submit">Create Note</button>
      </form>
    </div>`;

  // Append the form to the body
  document.body.insertAdjacentHTML('beforeend', formHTML);

  // Add 'submit' event listener to the form
  let form = document.getElementById('new-note-form');
  form.addEventListener('submit', function(event) {
    // Prevent the form from being submitted the default way
    event.preventDefault();

    // Collect the form data
    let formData = new FormData(form);

    // Send the form data to the API
    fetch('/api/service_manager/notes', {
      method: 'POST',
      body: formData
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      // If the response is OK, remove the form from the view
      document.getElementById('note-form').remove();
    })
    .catch(error => {
      console.log('There was a problem with the fetch operation: ' + error.message);
    });
  });
}