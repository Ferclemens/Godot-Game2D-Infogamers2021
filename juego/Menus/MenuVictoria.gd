extends Control

export var link_menu_principal = "res://juego/Menus/MenuPrincipal.tscn"

func _ready():
	$PanelPuntaje/VBoxContainer/Label.text = "puntaje {p}".format({"p":DatosPlayer.generar_puntaje()})

func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene(link_menu_principal)
