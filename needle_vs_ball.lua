ball_speed=0.5
ball_acceleration=0.1
x=96
y=124
yb=10
score=0
game_over=false
sb=0
ball_sprites={258,260,262,264,266,268,270,288,290,292,294,296,298,300,302}

function TIC()
	if game_over then
		print_game_over()
	else
		cls(10)
		map(0,0,30,17)
		check_if_ball_fell()
  move_ball()
  move_needle()
		render_ball(ball_sprites[sb])
		check_if_ball_popped()
		print(score)
	end
end

function check_if_ball_popped()
	is_ball_popped=yb+15>=y and xb+3<=x+6 and xb+12>=x+6
	if is_ball_popped 
 then
 	music(0,0,0,0,0)
  random_ball_index()
  score=score+1
  ball_speed=ball_speed+score*0.0005
  yb=10
  xb=random_x_for_ball()
 end
end

function render_ball(sprite_number)
	spr(sprite_number,xb,yb,0,1,0,0,2,2)
end

function random_ball_index()
	sb=math.random(1,#(ball_sprites))
end

function random_x_for_ball()
	return math.random(10,200)
end

function move_ball()
	if yb>=10 then yb=yb+ball_speed end
end

function move_needle()
	if btn(2) then x=x-2 end
	if btn(3) then x=x+2 end
	if x>=202 then x=10 end
	if x<=8 then x=200 end
	spr(256,x,y,0,1,0,0,2,2)
end

function print_game_over()
	cls(14)
	print("GAME OVER",90,65)
end

function check_if_ball_fell()
	if yb>=130 then
		game_over=true
	end
end

random_ball_index()
xb=random_x_for_ball()