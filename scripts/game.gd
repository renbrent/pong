extends Node2D

var score := [0,0]


func _on_ball_timer_timeout():
	$Ball.new_ball()


func _on_left_goal_body_entered(body):
	score[1] += 1
	$HUD/CPU.text = str(score[1])
	$BallTimer.start()

func _on_right_goal_body_entered(body):
	score[0] += 1
	$HUD/Player.text = str(score[0])
	$BallTimer.start()
