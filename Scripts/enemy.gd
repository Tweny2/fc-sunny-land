extends Area2D


@export var slime_speed = -100



var is_dead : bool = false

 
func _physics_process(delta: float) -> void:
	if not is_dead :
		position += Vector2(slime_speed,0) * delta
	if position.x < -280:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and not is_dead:
		body.game_over()

	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		is_dead = true
		area.queue_free()
		
		$AnimatedSprite2D.play("death")
		$DeathSFX.play()
		
		get_tree().current_scene.score += 1 
		await get_tree().create_timer(0.5).timeout
		queue_free()
		
