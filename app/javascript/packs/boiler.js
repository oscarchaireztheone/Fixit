export function noteIconCheck() {
  let myIcon = document.getElementById('note-icon');
  if(myIcon) {
    appendNoteForm(undefined, 'note-form', undefined);
    myIcon.addEventListener('click', function() {
      var noteForm = document.getElementById('note-form');
      if (noteForm) {
        noteForm.style.display = noteForm.style.display === "none" ? "block" : "none";
      } else {
        console.log("note-form element not found");
      }
    });
  }
}

export function appendNoteForm(container = document.body, formId = 'note-form', display = 'none') {
  let formDiv = container.querySelector(`#${formId}`);

  if (!formDiv) {
    // Create the form HTML string
    let formHTML = `
      <div id="${formId}" style="display: ${display};">
        <div class="container">
          <form id="holder">
            <label for="note_content">Note Content:</label>
            <textarea id="note_content" name="note[note_content]"></textarea>

            <label for="status">Status:</label>
            <input type="text" id="status" name="note[status]">

            <label for="call_id">Call id:</label>
            <input type="number" id="call_id" name="note[call_id]">

            <button type="submit">Create Note</button>
          </form>
        </div>
      </div>`;
    
    // Append the form to the container
    container.insertAdjacentHTML('beforeend', formHTML);

    // Get the form element
    let form = document.querySelector(`#${formId} #holder`);

    // Add 'submit' event listener to the form
    form.addEventListener('submit', function(event) {
      event.preventDefault();

      let formData = new FormData(form);
      let crewPhone = document.getElementById('crew-data').getAttribute('data-phone');
      formData.append('note[phone_number]', crewPhone);

      fetch('/api/service_manager/inner_notes', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        alert(data.status === "ok" ? "Note saved successfully!" : "Error saving note!");
      });
    });
  } else {
    // Toggle the visibility of the form
    formDiv.style.display = formDiv.style.display === 'none' ? 'block' : 'none';
  }
}
