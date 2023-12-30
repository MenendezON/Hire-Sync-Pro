# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Category.destroy_all

# Category.create!([{
#            name: 'Informatique'
#                   }, {
#                     name: 'Gestion'
#                   }, {
#                     name: 'Education'
#                   }, {
#                     name: 'Health'}, {
#                     name: 'Construction'}])

# p "Created #{Category.count} Categories"


Post.create!([{
  title: 'Technicien en informatique',
  description: 'With its refreshed design, the Vespa GTS Super is raring to set off on adventures with you and provide thrills aplenty. Its sporting soul comes with the latest examples of technology incorporated in new and surprising ways. There’s much more to this family than a mere change of colour, with plenty of scope for each and every proud owner to express their own style and individuality.',
  is_avalaible: true,
  category_id: 1
},{
  title: 'Chargé du personnel',
  description: 'With its refreshed design, the Vespa GTS Super is raring to set off on adventures with you and provide thrills aplenty. Its sporting soul comes with the latest examples of technology incorporated in new and surprising ways. There’s much more to this family than a mere change of colour, with plenty of scope for each and every proud owner to express their own style and individuality.',
  is_avalaible: true,
  category_id: 2
},{
  title: 'Professeur vacant',
  description: 'With its refreshed design, the Vespa GTS Super is raring to set off on adventures with you and provide thrills aplenty. Its sporting soul comes with the latest examples of technology incorporated in new and surprising ways. There’s much more to this family than a mere change of colour, with plenty of scope for each and every proud owner to express their own style and individuality.',
  is_avalaible: false,
  category_id: 3
}])

p "Created #{Post.count} Posts"