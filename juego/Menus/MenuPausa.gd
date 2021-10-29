extends Control

<<<<<<< HEAD
export var ruta_boton_menu = "res://juego/Menus/MenuPrincipal.tscn"
=======
>>>>>>> 8204c158fa8536a2657b0d341ed0e09fe777f295

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("menu") or event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused


func _on_BotonContinuar_pressed():
	get_tree().paused = false
	visible = false


<<<<<<< HEAD



func _on_BotonMenuPrincipal_pressed():
	get_tree().paused = false
	get_tree().change_scene(ruta_boton_menu)
=======
func _on_BotonMenuPrincipal_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://juego/Menus/MenuPrincipal.tscn")
>>>>>>> 8204c158fa8536a2657b0d341ed0e09fe777f295
