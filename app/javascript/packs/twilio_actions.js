import { noteIconCheck } from './boiler.js';

document.addEventListener('DOMContentLoaded', function() {
  noteIconCheck
  const startConferenceBtn = document.getElementById('start-conference-btn');

  startConferenceBtn.addEventListener('click', function() {
    fetch('/start_conference_call', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        'Content-Type': 'application/json'
      }
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('Network error');
      }
    })
    .then(data => {
      // Handle the response, e.g., display a success message
      alert(data.message);
    })
    .catch(error => {
      console.error('Error:', error);
    });
  });
});
// app/javascript/connect_call.js
document.addEventListener('DOMContentLoaded', function() {
  const connectCallBtn = document.getElementById('connect_call');
  const phoneToInput = document.getElementById('phone_to');

  let isConnected = false;
  let callSid = null;

  connectCallBtn.addEventListener('click', function() {
    if (!isConnected) {
      const phoneTo = phoneToInput.value;

      if (phoneTo) {
        fetch('/initiate_call_and_join_conference', {
          method: 'POST',
          headers: {
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ to: phoneTo })
        })
        .then(response => {
          if (response.ok) {
            return response.json();
          } else {
            throw new Error('Network error');
          }
        })
        .then(data => {
          isConnected = true;
          callSid = data.call_sid;
          connectCallBtn.textContent = 'Disconnect';
          connectCallBtn.classList.add('btn-danger');
          connectCallBtn.classList.remove('btn-primary');
        })
        .catch(error => {
          console.error('Error:', error);
        });
      } else {
        alert('Please enter a phone number');
      }
    } else {
      // Disconnect the call
      fetch('/disconnect_call', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ call_sid: callSid })
      })
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error('Network error');
        }
      })
      .then(data => {
        isConnected = false;
        callSid = null;
        connectCallBtn.textContent = 'Connect Call';
        connectCallBtn.classList.add('btn-primary');
        connectCallBtn.classList.remove('btn-danger');
      })
      .catch(error => {
        console.error('Error:', error);
      });
    }
  });
});
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
