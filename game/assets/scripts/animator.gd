extends Node2D

@export var player_ctrl : controller
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if player_ctrl.direction == 1:
		sprite.flip_h = false
	elif player_ctrl.direction == -1:
		sprite.flip_h = true 
		
	if abs(player_ctrl.velocity.x) > 0.0:
		animation_player.play("move")
	else:
		animation_player.play("idle")
		
	if player_ctrl.velocity.y < 0.0:
		animation_player.play("jump")
	elif player_ctrl.velocity.y > 0.0:
		animation_player.play("fall")
		
