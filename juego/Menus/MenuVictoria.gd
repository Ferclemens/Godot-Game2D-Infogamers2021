extends Control

func _ready():
	$PanelPuntaje/VBoxContainer/Label.text = "puntaje {p}".format({"p":DatosPlayer.generar_puntaje()})
