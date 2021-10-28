extends Area2D
signal consumida()


func _on_ZanahoriaLlave_body_entered(body):
	emit_signal("consumida")
	$Detector.set_deferred("disabled", true)
	$AnimationPlayer.play("consumir")
