extends Area2D

var esta_activado = false



func _on_body_entered(body):
	$AnimationPlayer.play("activado")
