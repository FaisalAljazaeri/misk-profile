# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


courses = [ 
    { title: 'Software Engineering Immersive', abbreviation: 'SEI' },
    { title: 'Data Science Immersive', abbreviation: 'DSI' },
    { title: 'User Experience Design Immersive', abbreviation: 'UXDI' },
]

Course.create(courses)

skills = [
    { name: 'HTML' },
    { name: 'CSS' },
    { name: 'JavaScript' },
    { name: 'JQuery' },
    { name: 'MongoDB' },
    { name: 'Express' },
    { name: 'SQL' },
    { name: 'PostgreSQL' },
    { name: 'Ruby' },
    { name: 'React' },
    { name: 'Git' }
]

Skill.create(skills)