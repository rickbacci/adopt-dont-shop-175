# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

shelters = Shelter.create(
  [
    {
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    },
    {
      name: 'Shelter2',
      address: '234 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    },
    {
      name: 'Shelter3',
      address: '345 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    }
  ]
)
