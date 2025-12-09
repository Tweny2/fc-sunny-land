'''
Godot4.5.1
v0.2.13.20251209_demo版本
	# The art of game design
		- 核心玩法
		- UI设计
	# 问题修复
		- 节点销毁，提高运行效率	
		- 岩羊
'''
extends Node2D

# =======================CONSTANT======================
const a = 1


# ========================VARIABLE=========================
@export var slime_scene : PackedScene
@export var spawn_timer : Timer
@export var score : int = 0
@export var score_label : Label
@export var game_over_label : Label

# ========================FUNC============================
func _ready() -> void:
	
	pass
	
	
func _process(delta: float) -> void:
	spawn_timer.wait_time -= 0.2 * delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time,1,9)

	score_label.text = "Score : " + str(score)
func _spawn_slime_timeout() -> void:
	var slime_node = slime_scene.instantiate()
	
	slime_node.position = Vector2(233,randf_range(30,107))
	get_tree().current_scene.add_child(slime_node)

func show_game_over():
	game_over_label.visible = true
