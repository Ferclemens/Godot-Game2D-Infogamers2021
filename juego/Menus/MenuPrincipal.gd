extends Control

export var escena = "res://juego/Niveles/Nivel1.tscn"
onready var animacion = $AnimationPlayer

func _ready():
	animacion.play("animacion_menu")

func _on_BotonInicio_pressed():
	get_tree().change_scene(escena)
