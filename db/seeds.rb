# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all

players = Player.create([
    {
        username: 'philivey',
        password: 'password',
        first_name: 'Phil',
        last_name: 'Ivey',
        email: 'philivey@gmail.com',
        password: 'password'
    }, {
        username: 'danielnegreanu',
        password: 'password',
        first_name: 'Daniel',
        last_name: 'Negreanu',
        email: 'danielnegreanuy@gmail.com',
        password: 'password'
    }, {
        username: 'chrismoneymaker',
        password: 'password',
        first_name: 'Chris',
        last_name: 'Moneymaker',
        email: 'chrismoneymaker@gmail.com',
        password: 'password'
    }, {
        username: 'philhellmuth',
        password: 'password',
        first_name: 'Phil',
        last_name: 'Hellmuth',
        email: 'philhellmuth@gmail.com',
        password: 'password'
    }, {
        username: 'doylebrunson',
        password: 'password',
        first_name: 'Doyle',
        last_name: 'Brunson',
        email: 'doylebrunson@gmail.com',
        password: 'password'
    }
])