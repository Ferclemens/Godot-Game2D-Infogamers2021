extends Control

<<<<<<< HEAD
<<<<<<< HEAD
export var ruta_boton_menu = "res://juego/Menus/MenuPrincipal.tscn"
export var ruta_boton_reintentar = "res://juego/Niveles/Nivel1.tscn"

func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene(ruta_boton_menu)


func _on_BotonReintentar_pressed():
	get_tree().change_scene(ruta_boton_reintentar)
=======
=======
var ruta_menu_principal = "res://juego/Menus/MenuPrincipal.tscn"
var nivel_actual = ""
>>>>>>> PcCasa

func _ready():
	nivel_actual = DatosPlayer.nivel_actual
	DatosPlayer.resert()

func _on_BotonMenuPrincipal_pressed():
<<<<<<< HEAD
	get_tree().change_scene("res://juego/Menus/MenuPrincipal.tscn")
>>>>>>> 8204c158fa8536a2657b0d341ed0e09fe777f295
=======
	get_tree().change_scene(ruta_menu_principal)

func _on_BotonContinuar_pressed():
	get_tree().change_scene(nivel_actual)
>>>>>>> PcCasa
