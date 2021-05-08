namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { `rails db:drop` }
      show_spinner('Criando BD...') { `rails db:create` }
      show_spinner('Migrando BD...') { `rails db:migrate` }
      `rails dev:add_mining_types`
      `rails dev:add_coins`
    else
      'Você não está em ambiente de desenvolvimento'
    end
  end

  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner('Cadastrando moedas...') do
      coins = [
        { description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://e7.pngegg.com/pngimages/567/101/png-clipart-bitcoin-bitcoin.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },

        { description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://w7.pngwing.com/pngs/853/418/png-transparent-logo-dash-cryptocurrency-ethereum-steemit-ripple-coin-blue-text-trademark.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },

        { description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://img2.gratispng.com/20180516/vgq/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9e70b61.4199610615265041219464.jpg',
          mining_type: MiningType.find_by(acronym: 'PoS')
        },

        { description: 'Iota',
        acronym: 'IOT',
        url_image: 'https://img2.freepng.es/20180901/zxv/kisspng-iota-cryptocurrency-blockchain-directed-acyclic-gr-bitcoinaverge-cryptocurrency-marketcap-amp-excha-5b8a2f022e2dd4.4478383715357826581892.jpg',
        mining_type: MiningType.find_by(acronym: 'PoC')
        },

        { description: 'ZCash',
        acronym: 'ZEC',
        url_image: 'https://logos-download.com/wp-content/uploads/2018/04/Zcash_logo_gold-700x700.png',
        mining_type: MiningType.find_by(acronym: 'PoW')
      }
      ]

      coins.each { |coin| Coin.find_or_create_by!(coin) }
    end
  end

  desc 'Cadastra os tipos de mineração'
  task add_mining_types: :environment do
    show_spinner('Cadastrando Tipos de Mineração...') do
      mining_types = [
        { description: 'Prof of Work', acronym: 'PoW' },
        { description: 'Prof of Stake', acronym: 'PoS' },
        { description: 'Prof of Capacity', acronym: 'PoC' }
      ]

      mining_types.each { |mining_type| MiningType.find_or_create_by!(mining_type) }
    end
  end



private

  def show_spinner(msg_start, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
