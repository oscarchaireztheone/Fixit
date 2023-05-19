module ApplicationHelper
	def friendly_slot_name(slot)
    slot_mappings = {
      'slot1' => '8am - 10am',
      'slot2' => '9am - 11am',
      'slot3' => '10am - 12pm',
      'slot4' => '11am - 1pm',
      'slot5' => '12pm - 2pm',
      'slot6' => '1pm - 4pm',
      'slot7' => '2pm - 5pm',
      'slot8' => '3pm - 6pm'
    }

    slot_mappings[slot] || slot
  end
end
