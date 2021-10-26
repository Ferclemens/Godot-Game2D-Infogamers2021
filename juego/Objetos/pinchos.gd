extends Area2D

export var es_trampa := false
onready var detector_personaje = $Detector

func _ready():
	if es_trampa:
		detector_personaje.enabled = true
		rotation_degrees = 180

func _process(delta):
	if detector_personaje.is_colliding():
		pass
	

func _on_body_entered(body):
	body.respawn()
