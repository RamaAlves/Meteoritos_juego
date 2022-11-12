#meteorito.gd

class_name Meteorito
extends RigidBody2D

#Atributos export
export var vel_lineal_base:Vector2 = Vector2(300.0,300.0)
export var vel_ang_base:float = 3.0
export var hitpoints_base:float = 10.0

#atributos onredy
onready var impacto_sfx = $ImpactoSFX
onready var animacion_destruccion = $AnimationPlayer

#Atributos
var hitpoints:float

#Metodos
func _ready() ->void:
	#angular_velocity = vel_ang_base
	pass

##Constructor
func crear(pos:Vector2, dir:Vector2, tamanio:float) ->void:
	position = pos
	#Calcular masa,tamanio del sprite y colisionador
	mass *=tamanio
	$Sprite.scale=Vector2.ONE*tamanio
	#radio = diametro/2
	var radio:int= int($Sprite.texture.get_size().x/2.4*tamanio)
	var forma_colision:CircleShape2D = CircleShape2D.new()
	forma_colision.radius = radio
	$CollisionShape2D.shape = forma_colision
	#calcular velocidades
	linear_velocity = (vel_lineal_base * dir/tamanio)*aleatorizar_velocidad()
	angular_velocity = (vel_ang_base / tamanio)*aleatorizar_velocidad()
	#Calcular hitpoints
	hitpoints = hitpoints_base*tamanio
	#Solo debug
	print("hitpoints: ", hitpoints)

##Metodos Custom
func recibir_danio(danio:float)->void:
	hitpoints-=danio
	animacion_destruccion.play("destruccion")
	if hitpoints<=0:
		destruir()
	impacto_sfx.play()

func destruir() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	Eventos.emit_signal("meteorito_destruido", global_position)
	queue_free()

func aleatorizar_velocidad() ->float:
	randomize()
	return rand_range(1.1,1.4)
