extends Node2D

@export var player_ctrl : controller
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if player_ctrl.direction == 1:
		sprite.flip_h = false
	elif player_ctrl.direction == -1:
		sprite.flip_h = true 
	if player_ctrl.attacking: 
		animation_player.play("Attack")
	if !player_ctrl.attacking:
		if abs(player_ctrl.velocity.x) > 0.0:
			animation_player.play("move")
		else:
			animation_player.play("idle")

		if player_ctrl.velocity.y < 0.0:
			animation_player.play("jump")
		elif player_ctrl.velocity.y > 0.0:
			animation_player.play("fall")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attack":
		player_ctrl.attacking = false
		player_ctrl.speed = 5
