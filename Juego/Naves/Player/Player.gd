#Player.gd
class_name Player
extends RigidBody2D

##atributos Export

export var potencia_motor:int = 20
export var potencia_rotacion:int =280

## atributos
var empuje:Vector2 = Vector2.ZERO
var dir_rotacion:int = 0

## Metodos
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	pass


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
