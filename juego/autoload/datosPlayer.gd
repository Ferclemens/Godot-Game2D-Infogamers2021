extends Node

signal actualizar_datos()
signal game_over()
var vidas = 3

func restar_vidas():
	vidas -= 1
	if vidas == 0:
		emit_signal("game_over")
	emit_signal("actualizar_datos")
