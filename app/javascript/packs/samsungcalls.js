// First, wrap your code inside a DOMContentLoaded event to ensure the DOM is fully loaded before attaching event listeners
import { noteIconCheck } from './boiler.js';

document.addEventListener('DOMContentLoaded', () => {
  // Get all button elements with the class 'auto-schedule'
  const autoScheduleButtons = document.querySelectorAll('.auto-schedule');
  noteIconCheck();  // Notes form 
  // Attach a click event listener to each button
  autoScheduleButtons.forEach((button) => {
    button.addEventListener('click', async () => {
      // Get the samsungcall.id from the data-value attribute of the clicked button
      const samsungCallId = button.getAttribute('data-value');
      const tableRow = button.closest('tr');
      const targetText = tableRow.querySelector('.status');

      // Prepare the request data
      const requestData = {
        samsungcall: {
          status: 1
        }
      };

      // Send an AJAX request to update the status of the samsung call
      try {
        const response = await fetch(`api/service_manager/auto_schedule?id=${samsungCallId}`, {
          method: 'post',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(requestData)
        });
        if (!response.ok) {
          throw new Error(`HTTP error ${response.status}`);
        }
        const updatedSamsungCall = await response.json();
        console.log('Samsung call updated successfully:', updatedSamsungCall);
        targetText.textContent = 1
      } catch (error) {
        console.error('Error updating samsung call:', error);
      }



    });
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