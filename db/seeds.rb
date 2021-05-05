# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins = [
  { description: 'Bitcoin',
    acronym: 'BTC',
    url_image: 'https://e7.pngegg.com/pngimages/567/101/png-clipart-bitcoin-bitcoin.png'
  },

  { description: 'Dash',
    acronym: 'DASH',
    url_image: 'https://w7.pngwing.com/pngs/853/418/png-transparent-logo-dash-cryptocurrency-ethereum-steemit-ripple-coin-blue-text-trademark.png'
  },

  { description: 'Ethereum',
   acronym: 'ETH',
   url_image: 'https://img2.gratispng.com/20180516/vgq/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9e70b61.4199610615265041219464.jpg' 
  }
]

coins.each { |coin| Coin.find_or_create_by!(coin) }
spinner.success('(Concluído)')
