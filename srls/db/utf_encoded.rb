# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#encoding: utf-8
users = User.create([{email: 'admini@gmail.com', password: 'secret', password_confirmation: 'secret', clave: 'secret', rol: 1 },
      {email: 'trans@gmail.com', password: 'secret', clave: 'secret', password_confirmation: 'secret', clave: 'secret', rol: 2 },
      {email: 'vali@gmail.com', password: 'secret', clave: 'secret', password_confirmation: 'secret', clave: 'secret', rol: 3 }])


vicariaCentro = Church.create([{nombre: 'Divina Providencia - Hospicio', vicaria: 'Vicaria Centro'},
 {nombre: 'Santo Domingo', vicaria: 'Vicaria Centro'},{nombre: 'S. Ignacio de Loyola', vicaria: 'Vicaria Centro'},
 {nombre: 'San José - S. Juan de Dios'.force_encoding('UTF-8'), vicaria: 'Vicaria Centro'}, {nombre: 'San Pedro', vicaria: 'Vicaria Centro'}, 
 {nombre: 'Virgen del Carmen - Castrense', vicaria: 'Vicaria Centro'}])

vicariaNorEste = Church.create([{nombre: 'V. del Carmen y S. M. Kolbe', vicaria: 'Vicaria Nor Este'}, 
	{nombre: 'N. Sr. de la Exaltación - Recoleta'.force_encoding('UTF-8'), vicaria: 'Vicaria Nor Este'}, {nombre: 'Santa Ana - Cala Cala', vicaria: 'Vicaria Nor Este'},
	{nombre: 'Divino Maestro', vicaria: 'Vicaria Nor Este'}, {nombre: 'N. Sra. de las Gracias', vicaria: 'Vicaria Nor Este'}])

vicariaNorCentro = Church.create([{nombre: 'Madre del Verbo Divino', vicaria: 'Vicaria Nor Centro'},
	{nombre: 'Ntra. Sra. de Guadalupe', vicaria: 'Vicaria Nor Centro'}, {nombre: 'Ntra. Sra. de la Anunciación'.force_encoding('UTF-8'), vicaria: 'Vicaria Nor Centro'},
	{nombre: 'Santa Mónica'.force_encoding('UTF-8'), vicaria: 'Vicaria Nor Centro'}])
.force_encoding('UTF-8')
vicariaNorOeste = Church.create([{nombre: 'Cristo Rey', vicaria: 'Vicaria Nor Oeste'}, {nombre: 'Ntra. Sra. de la Merced', vicaria: 'Vicaria Nor Oeste'},
	{nombre: 'Ntra. Sra. de La Paz', vicaria: 'Vicaria Nor Oeste'}, {nombre: 'San Gerardo', vicaria: 'Vicaria Nor Oeste'},
	{nombre: 'Inm. Corazón de María'.force_encoding('UTF-8'), vicaria: 'Vicaria Nor Oeste'}])

vicariaSurEste = Church.create([{nombre: 'Virgen de Fátima'.force_encoding('UTF-8'), vicaria: 'Vicaria Sur Este'}, {nombre: 'Ntra. Sra. de la Salette', vicaria: 'Vicaria Sur Este'},
	{nombre: 'San Eugenio de Macenod', vicaria: 'Vicaria Sur Este'}, {nombre: 'Santa Vera Cruz', vicaria: 'Vicaria Sur Este'},
	{nombre: 'Santa María del camino'.force_encoding('UTF-8'), vicaria: 'Vicaria Sur Este'}])

vicariaSurCentro = Church.create([{nombre: 'San Antonio de Padua', vicaria: 'Vicaria Sur Centro'}, {nombre: 'San Carlos Borromeo', vicaria: 'Vicaria Sur Centro'},
	{nombre: 'San Joaquín'.force_encoding('UTF-8'), vicaria: 'Vicaria Sur Centro'}, {nombre: 'San Juan Bautista - Alalay', vicaria: 'Vicaria Sur Centro'},
	{nombre: 'San Rafael', vicaria: 'Vicaria Sur Centro'}, {nombre: 'San Pio X', vicaria: 'Vicaria Sur Centro'}])

vicariaSurOeste = Church.create([{nombre: 'Maria Auxiliadora', vicaria: 'Vicaria Sur Oeste'}, {nombre: 'Divina Misericordia (Sivingani)', vicaria: 'Vicaria Sur Oeste'},
{nombre: 'Cuasi P. Don Bosco', vicaria: 'Vicaria Sur Oeste'}, {nombre: 'Cuasi P. Virgen del Socavón'.force_encoding('UTF-8'), vicaria: 'Vicaria Sur Oeste'}])

vicariaCapinota = Church.create([{nombre: 'San Agustín - Tapacarí'.force_encoding('UTF-8'), vicaria: 'Vicaria Capinota'}, {nombre: 'A. Antonio de Padua - Arque', vicaria: 'Vicaria Capinota'},
{nombre: 'S. Juan Bautista - Tacopaya', vicaria: 'Vicaria Capinota'}, {nombre: 'S. Pablo Apostol - Capinota', vicaria: 'Vicaria Capinota'},
{nombre: 'S. Juan Bautista - Itapaya', vicaria: 'Vicaria Capinota'}, {nombre: 'Jesús de Challa - Aramasi'.force_encoding('UTF-8'), vicaria: 'Vicaria Capinota'},
{nombre: 'Cristo de Ramadas', vicaria: 'Vicaria Capinota'}, {nombre: 'San Bartolomé - Bolivar'.force_encoding('UTF-8'), vicaria: 'Vicaria Capinota'}])

vicariaValleAlto = Church.create([{nombre: 'Apostol Santiago - Ansaldo', vicaria: 'Vicaria Valle Alto'},
	{nombre: 'Ntra. Sra. M. y S.A.P. - Tolata', vicaria: 'Vicaria Valle Alto'}, {nombre: 'N. S. de las Nieves - Santivañez'.force_encoding('UTF-8'), vicaria: 'Vicaria Valle Alto'},
	{nombre: 'Ntra. Sra. del Carmen - Cliza', vicaria: 'Vicaria Valle Alto'}, {nombre: 'S. Antonio de Padua - Tiraque', vicaria: 'Vicaria Valle Alto'},
	{nombre: 'San Bartolomé - Arani'.force_encoding('UTF-8'), vicaria: 'Vicaria Valle Alto'}, {nombre: 'San Benito - V. Mendoza', vicaria: 'Vicaria Valle Alto'},
	{nombre: 'San Juan Bautista - Punata', vicaria: 'Vicaria Valle Alto'}, {nombre: 'San Pedro - Tarata', vicaria: 'Vicaria Valle Alto'},
	{nombre: 'Santa Bárbara - Vacas'.force_encoding('UTF-8'), vicaria: 'Vicaria Valle Alto'}, {nombre: 'San Miguel - Toco', vicaria: 'Vicaria Valle Alto'}, 
	{nombre: 'San Isidro - Villa Rivero', vicaria: 'Vicaria Valle Alto'}])

vicariaValleBajo = Church.create([{nombre: 'Ntra. Sra. del Rosario - Vinto', vicaria: 'Vicaria Valle Bajo'},
	{nombre: 'San Idelfonso - Quillacollo', vicaria: 'Vicaria Valle Bajo'}, {nombre: 'San Lorenzo - Colcapirhua', vicaria: 'Vicaria Valle Bajo'},
	{nombre: 'San Miguel - Tiquipaya', vicaria: 'Vicaria Valle Bajo'}, {nombre: 'Santiago - El Paso', vicaria: 'Vicaria Valle Bajo'},
	{nombre: 'Santísima Trinidad - Quillacollo'.force_encoding('UTF-8'), vicaria: 'Vicaria Valle Bajo'}, {nombre: 'San Pedro - Sipe Sipe', vicaria: 'Vicaria Valle Bajo'},
	{nombre: 'Cruz Gloriosa - Quillacollo', vicaria: 'Vicaria Valle Bajo'}])

vicariaAyopaya = Church.create([{nombre: 'Ntra. Sra. del Rosario - Cocapata', vicaria: 'Vicaria Ayopaya'},
	{nombre: 'S. Francisco de Asis - Independencia', vicaria: 'Vicaria Ayopaya'}, {nombre: 'San José Obrero - Kami'.force_encoding('UTF-8'), vicaria: 'Vicaria Ayopaya'},
	{nombre: 'S. Bartolomé - Morochata'.force_encoding('UTF-8'), vicaria: 'Vicaria Ayopaya'}])

vicariaSacaba = Church.create([{nombre: 'San Pedro - Sacaba', vicaria: 'Vicaria Sacaba'}, {nombre: 'San Isidro - Colomi', vicaria: 'Vicaria Sacaba'},
	{nombre: 'N. Sra. de los Angeles - Melga', vicaria: 'Vicaria Sacaba'}, {nombre: 'V. de Guadalupe - Huayllani', vicaria: 'Vicaria Sacaba'}])

vicariaChapare = Church.create([{nombre: 'Exaltación - Chipiriri'.force_encoding('UTF-8'), vicaria: 'Vicaria Chapare'}, {nombre: 'S. A. de Padua - V. Tunari', vicaria: 'Vicaria Chapare'},
	{nombre: 'V. del Rosario - Eterazama', vicaria: 'Vicaria Chapare'}, {nombre: 'Santísima Trinidad - Isiboro'.force_encoding('UTF-8'), vicaria: 'Vicaria Chapare'},])