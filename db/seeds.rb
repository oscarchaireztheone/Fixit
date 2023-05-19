# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
unless Crew.find_by(email: 'oscarchairez65.oc@gmail.com')
  Crew.create!(
    email: 'oscarchairez65.oc@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  )
end


Samsungcall.delete_all
Day.delete_all

# Seed data for Samsungcall
Day.create({
  id: 12,
  date: "2023-05-21",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:22:07 UTC",
  updated_at: "2023-05-18 00:22:32 UTC"
})

Day.create({
  id: 13,
  date: "2023-05-22",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:22:43 UTC",
  updated_at: "2023-05-18 00:22:43 UTC"
})

Day.create({
  id: 14,
  date: "2023-05-23",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:22:55 UTC",
  updated_at: "2023-05-18 00:22:55 UTC"
})

Day.create({
  id: 16,
  date: "2023-05-24",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:23:17 UTC",
  updated_at: "2023-05-18 00:23:27 UTC"
})

Day.create({
  id: 17,
  date: "2023-05-25",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:23:39 UTC",
  updated_at: "2023-05-18 00:23:39 UTC"
})

Day.create({
  id: 15,
  date: "2023-05-26",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:23:02 UTC",
  updated_at: "2023-05-18 00:59:59 UTC"
})

Day.create({
  id: 18,
  date: "2023-05-15",
  tech_id: 1,
  status: "",
  slot1: 28,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 01:41:25 UTC",
  updated_at: "2023-05-18 01:42:19 UTC"
})

Day.create({
  id: 11,
  date: "2023-05-20",
  tech_id: 1,
  status: "",
  slot1: nil,
  slot2: nil,
  slot3: 29,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:22:00 UTC",
  updated_at: "2023-05-18 01:47:07 UTC"
})

Day.create({
  id: 9,
  date: "2023-05-18",
  tech_id: 1,
  status: "",
  slot1: 41,
  slot2: 30,
  slot3: nil,
  slot4: 40,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:21:43 UTC",
  updated_at: "2023-05-18 01:52:30 UTC"
})

Day.create({
  id: 10,
  date: "2023-05-19",
  tech_id: 1,
  status: "",
  slot1: 45,
  slot2: nil,
  slot3: nil,
  slot4: nil,
  slot5: nil,
  slot6: nil,
  slot7: nil,
  slot8: nil,
  created_at: "2023-05-18 00:21:54 UTC",
  updated_at: "2023-05-18 02:00:03 UTC"
})


Samsungcall.create({
  id: 41,
  fourk: "4170954465",
  name: "Marvin Robinson",
  phone1: "9192730501",
  phone2: "none",
  email: "rototiller@icloud.com",
  address: "7640 NE Dog Ridge Rd, Newberg, 97132",
  zipcode: "97132",
  hass: false,
  status: 0,
  note: "dacor",
  flag: nil,
  created_at: "2023-05-18 00:38:23 UTC",
  updated_at: "2023-05-18 00:48:35 UTC",
  day_id: 9
})

Samsungcall.create({
  id: 40,
  fourk: "4170945189",
  name: "Andrew Lee",
  phone1: "9193393830",
  phone2: "none",
  email: "korsoth@gmail.com",
  address: "3357 N Holladay St, Hillsboro, 97124",
  zipcode: "97124",
  hass: false,
  status: 0,
  note: "dacor",
  flag: nil,
  created_at: "2023-05-18 00:37:29 UTC",
  updated_at: "2023-05-18 01:39:20 UTC",
  day_id: 9
})

Samsungcall.create({
  id: 28,
  fourk: "4170976439",
  name: "Gretchen Francis",
  phone1: "9193393830",
  phone2: "none",
  email: "gretchenafrancis@gmail.com",
  address: "1111 C Ave, Lake Oswego, 97034",
  zipcode: "97034",
  hass: false,
  status: 100,
  note: "dacor",
  flag: nil,
  created_at: "2023-05-18 00:26:59 UTC",
  updated_at: "2023-05-18 01:42:33 UTC",
  day_id: 18
})

Samsungcall.create({
  id: 29,
  fourk: "4170990347",
  name: "JEFFREY SAUNDERS",
  phone1: "9197634923",
  phone2: "none",
  email: "jthurstons@hotmail.com",
  address: "7525 Sawtell Rd, Sheridan, 97378",
  zipcode: "97378",
  hass: false,
  status: 0,
  note: "dacor",
  flag: nil,
  created_at: "2023-05-18 00:28:46 UTC",
  updated_at: "2023-05-18 01:46:37 UTC",
  day_id: 11
})

Samsungcall.create({
  id: 30,
  fourk: "4171000397",
  name: "MAX BORDMAN",
  phone1: "3393830",
  phone2: "9197634923",
  email: "",
  address: "3695 SE Francis St, Portland, 97202",
  zipcode: "97202",
  hass: false,
  status: 0,
  note: "Out of warranty",
  flag: nil,
  created_at: "2023-05-18 00:29:31 UTC",
  updated_at: "2023-05-18 01:51:46 UTC",
  day_id: 9
})

Samsungcall.create({
  id: 45,
  fourk: "10247",
  name: "Megan Fox",
  phone1: "9197634923",
  phone2: "",
  email: "",
  address: "1616 N Bryant st Portland Or",
  zipcode: "97217",
  hass: false,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:44:32 UTC",
  updated_at: "2023-05-18 01:59:48 UTC",
  day_id: 10
})

Samsungcall.create({
  id: 27,
  fourk: "4170976557",
  name: "Karishma Singh",
  phone1: "9197634923",
  phone2: "none",
  email: "ksheetalsingh7@gmail.com",
  address: "7907 SW Frammy Way, Hillsboro, 97123",
  zipcode: "97123",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:26:04 UTC",
  updated_at: "2023-05-18 00:26:04 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 31,
  fourk: "4171014635",
  name: "Erich Bell",
  phone1: "9193393830",
  phone2: "none",
  email: "erichbell77@gmail.com",
  address: "6391 SE Kensington St, Hillsboro, 97123",
  zipcode: "97123",
  hass: nil,
  status: 0,
  note: "Out of warranty",
  flag: nil,
  created_at: "2023-05-18 00:30:05 UTC",
  updated_at: "2023-05-18 00:30:05 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 32,
  fourk: "4171022926",
  name: "TIMOTHY DONOGH",
  phone1: "9192730501",
  phone2: "none",
  email: "tdonogh@frontier.com",
  address: "601 Sunset Ct, Newberg, 97132",
  zipcode: "97132",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:30:49 UTC",
  updated_at: "2023-05-18 00:30:49 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 33,
  fourk: "4171044966",
  name: "Alejo Jaureguizar",
  phone1: "9197634923",
  phone2: "none",
  email: "alejo_726@hotmail.com",
  address: "20369 SW Lavender Pl, Sherwood, 97140",
  zipcode: "97140",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:31:19 UTC",
  updated_at: "2023-05-18 00:31:19 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 34,
  fourk: "4171042365",
  name: "Ben Henson",
  phone1: "9193393830",
  phone2: "none",
  email: "benheson38@gmail.com",
  address: "4552 SE Witch Hazel Rd, Hillsboro, 97123",
  zipcode: "97123",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:32:15 UTC",
  updated_at: "2023-05-18 00:32:15 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 35,
  fourk: "4171041303",
  name: "COLLEEN VALDEZ",
  phone1: "9197634923",
  phone2: "none",
  email: "grooviemama70@gmail.com",
  address: "22296 SW 82ND AVENUE, Tualatin, 97062",
  zipcode: "97062",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:32:42 UTC",
  updated_at: "2023-05-18 00:32:42 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 36,
  fourk: "4171058231",
  name: "Todd Hillbury",
  phone1: "9197634923",
  phone2: "none",
  email: "",
  address: "17327 Westview Dr, Lake Oswego, 97034",
  zipcode: "97034",
  hass: nil,
  status: 0,
  note: "Dacor",
  flag: nil,
  created_at: "2023-05-18 00:33:37 UTC",
  updated_at: "2023-05-18 00:33:37 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 37,
  fourk: "4170870168",
  name: "Claire Malatrea",
  phone1: "9197634923",
  phone2: "9193393830",
  email: "clairemalatrea@gmail.com",
  address: "6812 SE Blanton St, Hillsboro, 97123",
  zipcode: "97123",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:35:16 UTC",
  updated_at: "2023-05-18 00:35:16 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 38,
  fourk: "4170881784",
  name: "HOME DEPOT 4010",
  phone1: "9192730501",
  phone2: "none",
  email: "cos_4010@homedepot.com",
  address: "1950 SE Minter Bridge Rd, Hillsboro, 97123",
  zipcode: "97123",
  hass: nil,
  status: 0,
  note: "HomeDepot",
  flag: nil,
  created_at: "2023-05-18 00:36:09 UTC",
  updated_at: "2023-05-18 00:36:09 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 39,
  fourk: "4170899296",
  name: "Chris Mcnabb",
  phone1: "9197634923",
  phone2: "",
  email: "christopherd14@att.net",
  address: "2257 NE Summit Dr, Albany, 97321",
  zipcode: "97321",
  hass: nil,
  status: 0,
  note: "HomeDepot",
  flag: nil,
  created_at: "2023-05-18 00:36:59 UTC",
  updated_at: "2023-05-18 00:36:59 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 43,
  fourk: "10528",
  name: "Jessica Gomez",
  phone1: "9197634923",
  phone2: "9197634923",
  email: "",
  address: "4514 sw Cullen Boulevard -A Portland OR",
  zipcode: "97221",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:42:20 UTC",
  updated_at: "2023-05-18 00:42:20 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 44,
  fourk: "10518",
  name: "Victoria Gustafson",
  phone1: "9197634923",
  phone2: "",
  email: "",
  address: "245 Ne Buffalo St Portland Or",
  zipcode: "97221",
  hass: nil,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:43:28 UTC",
  updated_at: "2023-05-18 00:43:28 UTC",
  day_id: nil
})

Samsungcall.create({
  id: 42,
  fourk: "4170952199",
  name: "HELEN MCCLEERY",
  phone1: "9197634923",
  phone2: "9192730501",
  email: "lacreole5@msn.com",
  address: "766 SE Gleann Creek Ln, Dallas, 97338",
  zipcode: "97338",
  hass: false,
  status: 0,
  note: "",
  flag: nil,
  created_at: "2023-05-18 00:39:06 UTC",
  updated_at: "2023-05-18 00:45:08 UTC",
  day_id: nil
})

