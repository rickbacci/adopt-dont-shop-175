# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

shelters = Shelter.create(
  [
    { name: 'Shelter1' },
    { name: 'Shelter2' },
    { name: 'Shelter3' }
  ]
)
