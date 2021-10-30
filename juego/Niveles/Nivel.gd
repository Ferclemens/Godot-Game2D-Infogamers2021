extends Node
signal abrir_portal()
#COMENTARIO DE PRUEBA PARA GITHUB
var numero_llaves = 0
var contenedor_llaves
export var ruta_game_over = "res://juego/Menus/MenuGameOver.tscn"
export var nivel_actual = ""

func _ready():
	DatosPlayer.connect("game_over",self,"game_over")
	contenedor_llaves = get_node_or_null("Zanahorias")
	if contenedor_llaves != null:
		numero_llaves_nivel()

func numero_llaves_nivel():
	numero_llaves = contenedor_llaves.get_child_count()
	DatosPlayer.contabiizar_llaves(numero_llaves)
	for llave in contenedor_llaves.get_children():
		llave.connect("consumida",self,"llaves_restantes")


func llaves_restantes():
	numero_llaves -= 1
	if numero_llaves == 0:
		emit_signal("abrir_portal")

func game_over():
	DatosPlayer.nivel_actual = nivel_actual
	get_tree().change_scene(ruta_game_over)
