extends Control

var ruta_menu_principal = "res://juego/Menus/MenuPrincipal.tscn"
export var nivel_actual = ""

func _ready():
	$PanelPuntaje/VBoxContainer/Label.text = "Puntaje:  {p}".format({"p":DatosPlayer.generar_puntaje()})
	nivel_actual = DatosPlayer.nivel_actual
	DatosPlayer.resert()

func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene(ruta_menu_principal)

func _on_BotonContinuar_pressed():
	get_tree().change_scene(nivel_actual)

