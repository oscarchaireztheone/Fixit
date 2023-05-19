import * as bA from './buttonActions.js';


export function displayNotes(notes, container) {
  // Map each note to an HTML string
  let notesHTML = notes.map(note => `
    <div class="note ${note.status % 2 === 0 ? 'even-status' : 'odd-status'}" id='${note.id}''>
    <div class="container">
      <div class="row">
        <div class="col-4">
          <p>Phone: ${note.phone_number}</p>
        </div>
        <div class="col-4">
          <p>Status: ${note.status}</p>
        </div>
        <div class="col-4">
          <p>Call id: ${note.call_id}</p>
        </div>
      </div>
  <div class="row">
    <div class="col-6">
      <textarea id="noteSyncComplete${note.id}"class="form-control" rows="3">${note.note_content}${note.id}</textarea>
    </div>
    <div class="col-6">
      <button id="completeButton${note.id}" type="button" class="btn btn-primary" style="width: 40%;">Complete</button>
      <button id="kickBackButton${note.id}" type="button" class="btn btn-danger" style="width: 40%;">Kick-Back</button>
    </div>
  </div>
</div>
  `).join('');

  container.innerHTML = notesHTML;

  // Add event listeners
  notes.forEach(note => {
    document.getElementById(`completeButton${note.id}`).addEventListener('click', () => bA.noteSyncComplete(note.id, `noteSyncComplete${note.id}`, true));
    document.getElementById(`kickBackButton${note.id}`).addEventListener('click', () => bA.noteSyncComplete(note.id, `noteSyncComplete${note.id}`, false));

  });
}

export function updateModalContent(samsungCall) {
  let viewTarget = document.getElementById("modalBaseText");
  document.getElementById("closeButton").addEventListener('click', () => bA.closeCall(samsungCall.id));
  document.getElementById("rescheduleButton").addEventListener('click', () => bA.rescheduleCall(samsungCall.id, viewTarget));
  viewTarget.innerText = samsungCall.name + ": status " + samsungCall.status + ": id " + samsungCall.id;
}
