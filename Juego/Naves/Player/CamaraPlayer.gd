#CamaraPlayer.gd
class_name CamaraPlayer
extends CamaraJuego

##Variables Export
export var variacion_zoom:float = 0.1
export var zoom_min:float=0.8
export var zoom_max:float=1.5

##Metodos
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		controlar_zoom(-variacion_zoom)
	elif event.is_action_pressed("zoom_out"):
		controlar_zoom(variacion_zoom)

##Metodos Custom
func controlar_zoom(mod_zoom:float)->void:
	var zoom_x= clamp(zoom.x+mod_zoom, zoom_min,zoom_max)
	var zoom_y= clamp(zoom.y+mod_zoom, zoom_min,zoom_max)
	zoom_suavizado(zoom_x,zoom_y,0.15)
