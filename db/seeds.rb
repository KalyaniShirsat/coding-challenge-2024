# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

order_items = [{
    name: 'Rugiet ED Strong',
    dosage: '1 troche',
    quantity: 3,
    instructions: 'Take 1 troche 30 minutes before sex',
    price: 150.00
}]

user = User.create(
    email: 'user@example.com',
    credit_card_number: '4111 1111 1111 1111',
    expiry: '08/27',
    cvv: 988,
    password: 'Password1!',
    password_confirmation: 'Password1!',
)
doctor = User.create(
    email: 'doctor@example.com',
    password: 'Password1!',
    password_confirmation: 'Password1!',
    is_doctor: true
)

order = Order.create(user: user, doctor: doctor, order_items: order_items, total: 450.00, created_at: Time.now - 3.days)

Message.create(user: user, order: order, message: 'Can I get some more information on this product?', created_at: Time.now - 2.days)
Message.create(doctor: doctor, order: order, message: 'Sure, I can help you with that. What do you need to know?', created_at: Time.now - 2.days)
Message.create(user: user, order: order, message: 'What is the dosage?', created_at: Time.now - 1.day)
Message.create(user: user, order: order, message: 'Hello?', created_at: Time.now - 2.hours)
Message.create(user: user, order: order, message: 'Doc, are you there?', created_at: Time.now)
