#MAP:
# |0_0| |0_1| |0_2|
# |1_0| |1_1| |1_2|
# |2_0| |2_1| |2_2|

@direction = String.new

#SPAWN BLOCK
def block_1_1
	#Direction = nothing incase it was set to something in a prior block.
	@direction = ""
	while true
		#ONLY HAPPENS AFTER INITIAL SPAWN
		if @block_booleans["block_1_1"] == false	
			puts "You are lying face down in a pile of your own feces."
			puts "What do you want to do?"
			take_user_input
			reload_display
			if @user_command.include?("nothing")
				puts "Great."
			elsif @user_command.include?("stand") ||
				@user_command.include?("get up")
				puts "You stood up."
				@block_booleans["block_1_1"] = true
			elsif @user_command.include?("sit")
				puts "You sat up."
				@block_booleans["block_1_1"] = true
			else
				puts "Kinda hard to do that in your current state."
			end
		#THIS HAPPENS WHENEVER YOU ENTER THIS BLOCK AFTER INITIAL SPAWN
		else
			puts "You are on the edge of a slope in a pile of slippery poo."
			puts "What do you want to do now?"
			take_user_input
			reload_display
			@block_booleans["block_2_1"] = false
			break
		end
	end
	#NO MATTER WHAT YOU DO YOU SLIP AND FALL TO BLOCK 2-1
	block_2_1
end

#BOTTOM OF SLOPE
def block_2_1
	@direction = ""
	while true
		#ONLY HAPPENS AFTER COMING FROM BLOCK 1-1
		if @block_booleans["block_2_1"] == false
			fall_animation	
			take_health_hit(1)
			player_update_vitals
			reload_display
			puts "You slipped and fell down the slope taking one damage."
			puts "Probably shouldn't hangout near sheer drop-offs."
			@block_booleans["block_2_1"] = true
			test_for_death
		#THIS HAPPENS WHEN ENTERING FROM ANY OTHER BLOCK
		else
			puts "You are at the bottom of the slippery slope."
			puts "What do you want to do now?"
			take_user_input
			reload_display

			#LOOK AROUND
			if @user_command.include?("look")
				if @user_command.include?("north")
					puts "The slope is North of you."
				elsif @user_command.include?("south")						
					puts "There is a huge wall South of you. Looks impossible to get over it."
				elsif @user_command.include?("west")
					puts "There is a dark forest to the West."
				elsif @user_command.include?("east")
					puts "There is a open field to your East."
				else
					puts "Look where?"
				end
			elsif @user_command.include?("nothing")
				puts "Great."
			
			#DIRECTION CHOICES
			#NORTH:
			elsif @user_command.include?("up") &&
				@user_command.include?("slope") ||
				@user_command.include?("hill")
				climb_animation
				reload_display
				puts "You crawled back up the slope."
				@direction = "north"
				break
			#SOUTH: NOT FINISHED
			elsif @user_command.include?("up") &&
				@user_command.include?("slope") ||
				@user_command.include?("hill") 
				puts "You crawled back up the slope."
				@direction = "north"
				break
			#EAST: NOT FINISHED
			elsif @user_command.include?("up") &&
				@user_command.include?("slope") ||
				@user_command.include?("hill") 
				puts "You crawled back up the slope."
				@direction = "north"
				break
			#WEST: NOT FINISHED
			elsif @user_command.include?("up") &&
				@user_command.include?("slope") ||
				@user_command.include?("hill") 
				puts "You crawled back up the slope."
				@direction = "north"
				break								
			else
				other_responses
			end
		end
	end
	#CURRENT BLOCK IS 2-1
	#SOUTH IS NOT AN OPTION
	if @direction == "north"
		block_1_1
	elsif @direction == "east"
		block_2_2
	elsif @direction == "west"
		block_2_0
	end
end