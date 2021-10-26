extends Area2D

onready var animacion = $AnimationPlayer

func _ready():
	animacion.play("Idle")

func _on_PowerUpBase_body_entered(body):
	aplicar_power_up(body)
	animacion.play("Consumir")

func aplicar_power_up(body):
	pass
