##SectorDePeligros.gd
extends Area2D

##Atributos Export
export(String,"vacio","Meteorito","Enemigo") var tipo_peligro
export var numero_peligros:int = 10

#Signals

func _on_body_entered(body: Node) -> void:
	$CollisionShape2D.set_deferred("disabled",true)
	yield(get_tree().create_timer(0.1),"timeout")
	send_signal()

func send_signal() ->void:
	Eventos.emit_signal(
		"nave_en_sector_peligro",
		$PositionCentroSector.global_position,
		tipo_peligro,
		numero_peligros
	)
	queue_free()
