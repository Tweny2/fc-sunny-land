extends CharacterBody2D

# =========================CONSTANT=====================


# =========================VAR=======================
@export var move_speed = 200.0
@export var animator : AnimatedSprite2D
var is_game_over : bool = false
@export var bullet_scene : PackedScene
# =========================FUNC======================
func _process(_delta: float) -> void:
	if velocity == Vector2.ZERO or is_game_over:
		$RunningSFX.stop()
	elif not $RunningSFX.playing:
		$RunningSFX.play()


func _physics_process(_delta):
	var input_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_vector * move_speed 
	if not is_game_over:
		if velocity == Vector2.ZERO:
			animator.play("idle")
		else:
			animator.play("run")
	else:
		velocity = Vector2.ZERO
		animator.play("die")
		
	
	
	move_and_slide()

func game_over():
	if not is_game_over:
		
		is_game_over = true
		get_tree().current_scene.show_game_over()
		$GameOverSFX.play()
		
		$RestartTimer.start()
		

		
func _on_fire_timeout() -> void:
	if velocity != Vector2.ZERO or is_game_over:
		return
	var bullet_node = bullet_scene.instantiate()
	bullet_node.position = position + Vector2(12,7)
	get_tree().current_scene.add_child(bullet_node)
	$FireSFX.play()


func _reload_scene_timer_timeout() -> void:
	get_tree().reload_current_scene()
