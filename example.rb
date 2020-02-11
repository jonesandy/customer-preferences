require_relative './lib/preferences.rb'

customers = [
  { id: 'A', mday: nil, day: nil, everyday: true, none: false },
  { id: 'B', mday: 10, day: nil, everyday: false, none: false },
  { id: 'C', mday: nil, day: ['TUE', 'FRI'], everyday: false, none: false },
  { id: 'D', mday: nil, day: nil, everyday: false, none: true }
]

preferences = Preferences.new(customers)

preferences.create_preferences
