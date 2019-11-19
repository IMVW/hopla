skills = ["cocktails", "dessert", "barista", "chef", "sous chef", "oyster", "host", "balencing", "keys", "stock-taking", "reservation scheduling", "operate fryer",
"operate grill", "operate oven", "ordering supplies"]
pw = "123456"
pwc = "123456"
fn = ["Leon", "Rick", "Jean", "Elena", "Phillip", "Tom", "Maggie", "Patrick", "Luca", "Christina"]
ln = ["Jansen", "Miller", "Hall", "Johnston", "Van Dijk", "Van de Berg", "Wolf", "Schmid", "Jacobs", "Fischer"]
rl = ["Manager", "Employee"]

puts "Creating 10 Users..."
User.create!(email:"#{fn[0]}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[0], last_name: ln[0] , role: rl[0], phone_number:"+31-655-5288-83", skills: skills.sample(2), birthday:"20.05.1989")
a_user = []
a_user << User.create!(email:"#{fn[1].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[1], last_name: ln[1] , role: rl[1], phone_number:"", skills: skills.sample(3), birthday:"")
a_user << User.create!(email:"#{fn[2].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[2], last_name: ln[2] , role: rl[1], phone_number:"", skills: skills.sample(2), birthday:"10.08.1964")
a_user << User.create!(email:"#{fn[3].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[3], last_name: ln[3] , role: rl[1], phone_number:"+31-655-5982-35", skills: skills.sample(4), birthday:"11.03.1980")
a_user << User.create!(email:"#{fn[4].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[4], last_name: ln[4] , role: rl[1], phone_number:"+31-455-5989-71", skills: skills.sample(2), birthday:"")
a_user << User.create!(email:"#{fn[5].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[5], last_name: ln[5] , role: rl[1], phone_number:"+31-655-5724-10", skills: skills.sample(3), birthday:"27.03.1990")
a_user << User.create!(email:"#{fn[6].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[6], last_name: ln[6] , role: rl[1], phone_number:"", skills: skills.sample(2), birthday:"")
a_user << User.create!(email:"#{fn[7].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[7], last_name: ln[7] , role: rl[1], phone_number:"+31-455-5989-71", skills: skills.sample(2), birthday:"")
a_user << User.create!(email:"#{fn[8].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[8], last_name: ln[8] , role: rl[1], phone_number:"", skills: skills.sample(4), birthday:"10.12.1992")
a_user << User.create!(email:"#{fn[9].downcase}@gmail.com", password: pw, password_confirmation: pwc, first_name: fn[9], last_name: ln[9] , role: rl[1], phone_number:"+31-655-4182-35", skills: skills.sample(2), birthday:"")
puts "Created 10 Users..."


puts "Creating 4 Departments..."
a_dep = []
a_dep << Department.create!(name:"Floor")
a_dep << kitchen = Department.create!(name:"Kitchen")
a_dep << dishwashing = Department.create!(name:"Dishwashing")
a_dep << management = Department.create!(name:"Management")
puts "Created 4 Departments..."


puts "Creating 10 Shifts..."
Shift.create!(start_time: Time.now + 1.hour, end_time: Time.now + 8.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 2.hour, end_time: Time.now + 9.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 0.5.hour, end_time: Time.now + 6.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 3.hour, end_time: Time.now + 9.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 0.5.hour, end_time: Time.now + 3.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 0.7.hour, end_time: Time.now + 6.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 4.hour, end_time: Time.now + 8.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 20.hour, end_time: Time.now + 27.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 0.2.hour, end_time: Time.now + 6.hour, department: a_dep.sample, user: a_user.sample)
Shift.create!(start_time: Time.now + 3.hour, end_time: Time.now + 5.hour, department: a_dep.sample, user: a_user.sample)
puts "Created 10 Shifts..."

