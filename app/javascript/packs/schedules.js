   import { noteIconCheck } from './boiler.js';

document.addEventListener('DOMContentLoaded', function() {
  noteIconCheck
document.getElementById('fetch-available-slots').addEventListener('click', async () => {
      const response = await fetch('/schedules/available_slots');
      const availableSlots = await response.json();
      const list = document.getElementById('available-slots-list');
      list.innerHTML = '';
      availableSlots.forEach(({ day, slots }) => {
        const listItem = document.createElement('li');
        listItem.textContent = `${day.date}: ${slots.join(', ')}`;
        list.appendChild(listItem);
      });
    });

    document.getElementById('fetch-days-by-proximity').addEventListener('click', async () => {
      const zipcode = document.getElementById('zipcode-input').value;
      const response = await fetch(`/schedules/days_by_proximity?zip=${zipcode}`);
      const daysByProximity = await response.json();
      const list = document.getElementById('days-by-proximity-list');
      list.innerHTML = '';
      daysByProximity.forEach(dayWithSlots => {
        const day = dayWithSlots.day;
        const slots = dayWithSlots.slots;
        const formattedSlots = formatSlots(slots);
        const listItem = document.createElement('li');
        listItem.textContent = `${day.date}: Ordered Slots${formattedSlots}`;
        // Append listItem to the desired element, e.g., an unordered list with id 'days-list'
        document.getElementById('days-by-proximity-list').appendChild(listItem);
      });
    });
});
function formatSlots(slots) {
  let slotsString = '';
  for (const slot of slots) {
    const slotNumber = slot[0];
    const distance = slot[1];
    const distanceString = distance === null ? 'null' : `${distance} meters`;
    slotsString += `, slot ${slotNumber}: ${distanceString}`;
  }
  return slotsString;
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
