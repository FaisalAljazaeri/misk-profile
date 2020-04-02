# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = [
    { first_name: 'Faisal', last_name: 'Aljazaeri', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuIseEQRShUfAqkdaB_cI0AJe95RnZXia5YMToFAQAOeLoIBqm&usqp=CAU'},
    { first_name: 'John', last_name: 'Doe', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuIseEQRShUfAqkdaB_cI0AJe95RnZXia5YMToFAQAOeLoIBqm&usqp=CAU'},
    { first_name: 'Jane', last_name: 'Doe', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuIseEQRShUfAqkdaB_cI0AJe95RnZXia5YMToFAQAOeLoIBqm&usqp=CAU'},
    { first_name: 'Omar', last_name: 'Alharbi', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuIseEQRShUfAqkdaB_cI0AJe95RnZXia5YMToFAQAOeLoIBqm&usqp=CAU'},
    { first_name: 'Ahmed', last_name: 'Albokhari', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuIseEQRShUfAqkdaB_cI0AJe95RnZXia5YMToFAQAOeLoIBqm&usqp=CAU'},
]

Student.create(students)