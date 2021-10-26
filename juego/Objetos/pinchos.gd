extends Area2D

export var es_trampa = false
onready var detector_personaje = $Detector
var color_trampa = Color.red
onready var animacion = $AnimationPlayer

func _ready():
	if es_trampa:
		$Sprite.modulate = color_trampa
		detector_personaje.enabled = true
		rotation_degrees = 180

func _process(delta):
	if detector_personaje.is_colliding():
		detector_personaje.set_deferred("enable", false)
		animacion.play("caer")

func _on_body_entered(body):
	body.respawn()
