import * as coolWords from './coolwords.js'
import  { handleViewOpen } from './dashboard.js'

export function noteSyncComplete(note_id, payloadLoc, change) {	// what is change used for??				
//expects Note id and the id container containg the payload containg the update payload
  // Get the updated note_content from the textarea
  let userConfirmation = confirm("Are you sure you want to proceed?");
  if (userConfirmation) {

	  console.log(`note id: ${note_id}, payLoadLocation: ${payloadLoc}`);
	  let updatedNoteContent = document.getElementById(payloadLoc).value;
		let note = {
		  note: {
		    note_content: updatedNoteContent
		  }
		};
		let action = '';
		if (change == true) {
			action='sync_complete';
		}
		else {
			action='sync_kick_back';
		}

		// Make the API call
		fetch(`${coolWords.BASE_URL}/api/service_manager/${action}?id=${note_id}`, {
		  method: 'PUT', // Use 'PUT' or 'PATCH' if you're updating an existing resource
		  headers: {
		    'Content-Type': 'application/json',
		  },
		  body: JSON.stringify(note),
		})
	  .then(response => response.json())
	  .then(data => {
	    // do stuff with the data returned, only fuctions here for reuseability
	    let parentDiv = nestedUpdate(data.note_content, `${data.id}`, `#noteSyncComplete${data.id}` )

	    // Toggle the class of the parent div
	    if(parentDiv.classList.contains('even-status')) {
	      parentDiv.classList.remove('even-status');
	      parentDiv.classList.add('odd-status');
	    } else {
	      parentDiv.classList.remove('odd-status');
	      parentDiv.classList.add('even-status');
	    }
	  })
	  .catch((error) => {
	    console.error('Error:', error);
	  });
	}
	else {
		Console.log("ok so then what.")
	}
}

function nestedUpdate(payload, parent, child){
	console.log("****************");
	console.log(payload);
  	console.log(parent);
  	console.log(parent);
	let parentDiv = document.getElementById(parent);
	// Find the textarea within the parent div
	let textarea = parentDiv.querySelector(child);
	// Set the textarea's content to note.note_content
	textarea.value = payload;
	return parentDiv
}

export function closeCall(call_id) {
	let userConfirmation = confirm("Are you sure you want to close this call");
  	if (userConfirmation) {
		fetch(`/api/service_manager/close_call?id=${call_id}`, {
	        method: 'GET',
	    })
      	.then(response => {
		  if (response.ok) {
		    return response.json();
		  } else {
		    throw new Error('Error closing call');
		  }
		})
		.then(data => {
		  alert(`${data.samsungcall.name} Call closed`);
		  handleViewOpen(data.samsungcalls);
		})
		.catch(error => {
		  alert(`Error closing call: ${error.message}`);
		});
	 }
}

export function rescheduleCall(call_id, container) {
	fetch(`/api/service_manager/rescheduleCallAvailableSlots?id=${call_id}`, {
		method: 'GET',
	})
	.then(response => response.json())
	.then(data => {
	  	//slots:{ slot: slot_number, distance: distance, date: day.date}
	  	console.log("**************");
	  	console.log(data);
	  	createAppointmentForm(data, container);        
	});
}
function createAppointmentForm(data, container) {
  // Create the form element
  const form = document.createElement('form');
  const samsung_id = data.samsungcall.id
  console.log("samsungcall id bellow");
  console.log(data.samsungcall.id);
  form.addEventListener('submit', submitForm);

  // Create a row for each slot
  data.slots.forEach((slot) => {
    // Create a div for the row
    const row = document.createElement('div');
    row.classList.add('slot-row'); // Add class for the slot row

    // Create a radio button for the slot
    const radio = document.createElement('input');
    radio.type = 'radio';
    radio.data = `${samsung_id}`;
    radio.name = 'slot';
    radio.id = `${slot.date}`;
    radio.value = `slot${slot.slot}`;
    radio.classList.add('slot-radio'); // Add class for the slot radio button
    row.appendChild(radio);

    // Create labels to display the slot details
    const slotLabel = document.createElement('label');
    slotLabel.textContent = `Slot: ${slot.slot}`;
    slotLabel.classList.add('slot-details'); // Add class for the slot details
    row.appendChild(slotLabel);

    const distanceLabel = document.createElement('label');
    distanceLabel.textContent = `Distance: ${slot.distance}`;
    distanceLabel.classList.add('slot-details'); // Add class for the slot details
    row.appendChild(distanceLabel);

    const dateLabel = document.createElement('label');
    dateLabel.textContent = `Date: ${slot.date}`;
    dateLabel.classList.add('slot-details'); // Add class for the slot details
    row.appendChild(dateLabel);

    // Add the row to the form
    form.appendChild(row);
  });

  // Create a submit button
  const submitButton = document.createElement('input');
  submitButton.type = 'submit';
  submitButton.value = 'Make Appointment';
  form.appendChild(submitButton);

  // Append the form to the container
  container.appendChild(form);
}


function submitForm(event) {
  event.preventDefault();
  // Get the selected slot and its corresponding details
  const selectedSlot = document.querySelector('input[name="slot"]:checked');
  const day_date = selectedSlot.id;
  const samsungCall = selectedSlot.data;
  console.log(`samsungcall Data ${samsungCall}`)

  // Send the form data to the API
  const formData = new FormData(event.target);
  formData.append('day_date', day_date);
  formData.append('samsungCall_id', samsungCall);

  const url = '/api/service_manager/make_appointment';

  fetch(url, {
    method: 'POST',
    body: formData,
  })
    .then((response) => {
      if (response.ok) {
        // Close the form on successful reply
        const form = event.target;
        form.parentNode.removeChild(form);
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
}

