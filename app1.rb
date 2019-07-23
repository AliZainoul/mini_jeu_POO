require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry
puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Veuillez entrer votre prénom ou pseudo: \n"
puts ">"
var = gets.chomp
player = HumanPlayer.new(var)
array = []
player1 = Player.new ("Josiane")
print "#{player1}"
array << player1
player2 = Player.new ("José")
print "#{player2}"
array << player2
puts array
while player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts player.show_state
  puts "Quelle action voulez-vous effectuer ?"
  print "a - chercher une meilleure arme ? \n"
  print "s - chercher a se soigner ? \n"
  print "\n"
  puts "Attaquer un joueur en vue : "
  print "0 - #{player1.name} a #{player1.life_points} points de vie. \n"
  print "1 - #{player2.name} a #{player2.life_points} points de vie. \n"
  print ">"
  varr = gets.chomp.to_s
  case varr
  when "a"
    player.search_weapon
  when "s"
    player.search_health_pack
  when "0"
    player.attacks(player1)
  when "1"
    player.attacks(player2)
  end
  if player1.life_points > 0 || player2.life_points > 0
    puts "Les autres joueurs vous attaquent ! \n"
  end

  array.each do |x|
    if x.life_points == 0
      then
      break
    elsif x.life_points == 0
      break
    else
      if player.life_points == 0
        then
        break
      else  x.attacks(player)
      end
    end
  end
end

if player.life_points > 0
  then
  puts "Le jeu est fini, vous en ressortez gagnant! Félicitations !! :)."
else
  puts "Le jeu est fini, boom boom boom, malheuresement pour vous, vous aviez perdu. Réessayez encore. :) "
end
