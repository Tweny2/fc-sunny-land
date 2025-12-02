'''
Godot4.5.1
v0.1.21.20251202_init版本
	# 面向对象，分析需求，搭建框架
		# GameManager
		# 游戏最小系统
	# 游戏最小系统
		- 事件获取
		- 碰撞检测
		- Timer
		- Signal
		
'''
extends Node2D
# ========================VAR=============================
@export var slime_scene : PackedScene
@export var spawn_timer : Timer


# ========================FUNC============================
func _process(delta: float) -> void:
	spawn_timer.wait_time -= 0.2 * delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time,1,9)

func _spawn_slime_timeout() -> void:
	var slime_node = slime_scene.instantiate()
	
	slime_node.position = Vector2(233,randf_range(30,107))
	get_tree().current_scene.add_child(slime_node)
	
