require 'win32/sound'
include Win32
require 'C:\Users\micha\Desktop\Ruby\The_Game\world'
require 'C:\Users\micha\Desktop\Ruby\The_Game\character_user.rb'

@block_booleans = {"block_0_0" => false, "block_0_1" => false, "block_0_2" => false, "block_1_0" => false, "block_1_1" => false, "block_1_2" => false, "block_2_0" => false, "block_2_1" => false, "block_2_2" => false}

#PLAYER INITIAL VITALS
@health = 2
@health_string = "Health: #{"+" * @health}"
@health_row = " "*(100-@health_string.length) + @health_string
@inventory = ["Sword", "Hot Dog"]
@inventory_string = "Inventory: #{@inventory.join(" | ")}"
@inventory_row = " "*(100-@inventory_string.length) + @inventory_string
@user_command = String.new

#PLAYER UPDATE VITALS
def player_update_vitals
	@health_string = "Health: #{"+" * @health}"
	@health_row = " "*(100-@health_string.length) + @health_string
	@inventory_string = "Inventory: #{@inventory.join(" | ")}"
	@inventory_row = " "*(100-@inventory_string.length) + @inventory_string
end


#RELOAD DISPLAY
def reload_display
	@health_row = " "*(100-@health_string.length) + @health_string
	system "cls"
	puts ""
	puts "THE GAME".center(100)
	puts @health_row
	puts @inventory_row
end

#TAKE USER INPUT
def take_user_input
	@user_command = gets.chomp.downcase
end

#TAKE HEALTH HIT
def take_health_hit(damage)
	@health-=damage
end

#TEST FOR DEATH
def test_for_death
	if @health == 0
		puts
		puts " You died!"
		puts
		puts "  (x·x)"
		puts " >-( )-<"
		puts "   ( )"
		puts "   | |"
		Sound.beep(200,1200)
		abort
	end
end

#POSSIBLE RESPONSES FOR EVERY BLOCK
def other_responses
	if @user_command.include?("hot") &&
		@user_command.include?("dog")
		if @inventory.include?("Hot Dog")
			@inventory.delete("Hot Dog")
			take_health_hit(-3)
			player_update_vitals
			reload_display
			puts "You ate your hot dog."
			puts "Health increased by 3."
		else
			puts "You don't have a hot dog."
		end
	else
		puts "You can't do that."
	end 
end

reload_display
block_1_1