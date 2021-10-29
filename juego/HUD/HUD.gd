extends Control

onready var etiqueta_vidas = $ContenedorVidas/Cantidad


func _ready():
	DatosPlayer.connect("actualizar_datos",self,"actualizar_hud")
	actualizar_hud_vidas()

func actualizar_hud_vidas():
	etiqueta_vidas.text = "%s" %DatosPlayer.vidas
