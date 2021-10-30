extends Area2D

export(String, "oro","plata","bronce") var tipo_moneda

onready var animacion = $AnimatedSprite
onready var animacion_consumir = $AnimationPlayer
onready var colision_personaje = $ColisionPersonaje

var c = 0

func _ready():
	animacion.play()

func _on_body_entered(_body):
	DatosPlayer.contar_monedas(tipo_moneda)
	colision_personaje.set_deferred("disabled", true)
	c += 1
	animacion_consumir.play("Consumir")

