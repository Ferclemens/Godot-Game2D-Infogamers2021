extends Area2D

var esta_activado = false

func _ready():
	get_parent().connect("abrir_portal",self,"play_animacion")

func _on_Portal_body_entered(body):
		if esta_activado:
			body.play_entrar_portal(global_position)	
			print("Mission Complete!")

func play_animacion():
	esta_activado = true
	$AnimationPlayer.play("activado")
	$AnimatedSprite.play("default")
