# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
    { name: '国語' },
    { name: '算数' },
    { name: '理科'},
    { name: '社会'},
    { name: '英語'},
    { name: 'その他'}
    ])