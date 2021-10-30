extends Area2D

var color_trampa = Color.brown

onready var animacion = $AnimationPlayer
onready var detector_personaje = $Detector

export var es_trampa = false

func _ready():
	if es_trampa:
		$Sprite.modulate = color_trampa
		detector_personaje.enabled = true
		rotation_degrees = 180

func _process(_delta):
	if detector_personaje.is_colliding():
		detector_personaje.set_deferred("enable", false)
		animacion.play("caer")

func _on_body_entered(body):
	body.respawn()
