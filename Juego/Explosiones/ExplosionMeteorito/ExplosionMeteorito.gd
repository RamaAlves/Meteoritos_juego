#ExplosionMeteorito.gd

class_name ExplosionMeteorito
extends Node2D

#internal signals
func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	queue_free()
