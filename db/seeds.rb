# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GuestState.create(code: 'undefined', label: 'Unbekannt')
GuestState.create(code: 'invited', label: 'Eingeladen')
GuestState.create(code: 'accepted', label: 'Kommt')
GuestState.create(code: 'declined', label: 'Abgesagt')
GuestState.create(code: 'payed', label: 'Bezahlt')