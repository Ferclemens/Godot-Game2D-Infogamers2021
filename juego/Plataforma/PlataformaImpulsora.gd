extends Area2D

onready var animacion = $AnimationPlayer
onready var salto_plataforma = $SaltoPlataforma


func _ready():
	animacion.play("Idle")




func _on_DetectorImpulso_body_entered(body):
	salto_plataforma.play()
	animacion.play("Impulsar")
	body.impulsar()
