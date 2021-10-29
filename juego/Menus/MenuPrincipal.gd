extends Control

<<<<<<< HEAD
export var ruta_boton_inicio = "res://juego/Niveles/Nivel1.tscn"
=======
export var escena = "res://juego/Niveles/Nivel1.tscn"
>>>>>>> 8204c158fa8536a2657b0d341ed0e09fe777f295
onready var animacion = $AnimationPlayer

func _ready():
	animacion.play("animacion_menu")

func _on_BotonInicio_pressed():
<<<<<<< HEAD
	get_tree().change_scene(ruta_boton_inicio)
=======
	get_tree().change_scene(escena)
>>>>>>> 8204c158fa8536a2657b0d341ed0e09fe777f295
