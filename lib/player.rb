class Player
  attr_accessor :name, :life_points

  def initialize(player)
    life = 10
    @name = player
    @life_points = life
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie. \n"
  end

  def gets_damage (damage)
    @life_points -= damage
    if @life_points <= 0
      then
      @life_points = 0
      puts "Le joueur #{@name} est mort, pour cause: il a #{@life_points} points de vie."
    end
  end

  def attacks (player)
    dommage = 0
    puts "Le joueur #{@name} attaque le joueur #{player.name}"
    dommage = compute_damage
    puts "Le joueur #{@name} a subi au joueur #{player.name} un dommage de #{dommage} points."
    player.gets_damage(dommage)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player)
    life = 100
    weapon = 1
    @name = player
    @life_points = life
    @weapon_level = weapon
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie, ainsi qu'une arme de niveau #{@weapon_level}. \n"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    var = 0
    var = rand(1..6)
    puts "Vous aviez trouvé une nouvelle arme de niveau #{var}."
    if var > @weapon_level
      then
      @weapon_level = var
      puts "Youhou, bonne nouvelle! Vous aviez pu récupérer une nouvelle arme de niveau #{@weapon_level}, meilleure que celle que vous aviez."
    else
      puts "Dommage, l'arme trouvée a un niveau inférieur a celle que vous aviez actuellement; Pff..Courage"
    end
  end

  def search_health_pack
    var = 0
    var = rand(1..6)
    case var
    when 1
      puts "Malheuresement, vous aviez rien trouvé."
    when (2..5)
      @life_points += 50
      if @life_points >= 100
        then
        @life_points = 100
      end
      puts "Félicitations, vous aviez trouvé un pack de 50 points de vie, actuellement vous aviez: #{@life_points} points de vie."
    when 6
      @life_points += 80
      if @life_points >= 100
        then
        @life_points = 100
      end
      puts "Wouaw! Vous aviez trouvé un pack de 80 points de vie, actuellement vous aviez: #{@life_points} points de vie."
      end
  end

end
