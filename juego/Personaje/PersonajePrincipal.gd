extends KinematicBody2D

var movimiento = Vector2.ZERO
var fuerza_salto_original
var aceleracion_caida_original
var puede_moverse = true

onready var animacion = $AnimatedSprite
onready var audio_salto = $audio_jump
onready var camara = $Camera2D
onready var enfriamiento_power_up_saltar = $EnfriamientoPowerUpSalto
onready var enfriamiento_power_up_volar = $EnfriamientoPowerUpVolar
onready var animacion_personaje = $AnimationPlayer

export var velocidad = Vector2(150.0,150.0)
export var aceleracion_caida = 400
export var fuerza_salto = -2200
export var fuerza_rebote = 350
export var impulso = -3800
export var aceleracion_caida_power_up = 140 

func _physics_process(_delta):
	movimiento.x = velocidad.x * tomar_direccion()
# warning-ignore:return_value_discarded
	move_and_slide(movimiento, Vector2.UP)
	saltar()
	caer()
	colision_techo()
	caida_al_vacio()

func _ready():
	animacion_personaje.play("aclarar")
	fuerza_salto_original = fuerza_salto
	aceleracion_caida_original = aceleracion_caida

func tomar_direccion():
	var direccion = 0
	if puede_moverse:
		direccion = Input.get_action_strength("mover_derecha") - Input.get_action_strength("mover_izquierda")
		if direccion == 0:
			animacion.play("idle")
		else:
			if direccion<0:
				animacion.flip_h = true
			else:
				animacion.flip_h = false
			animacion.play("run")
	
	return direccion

func saltar():
	if Input.is_action_just_pressed("salto") and is_on_floor() and puede_moverse:
		audio_salto.play()
		animacion.play("jump")
		movimiento.y += fuerza_salto
# warning-ignore:return_value_discarded
	move_and_slide(movimiento, Vector2.UP)

func cambiar_fuerza_salto():
	enfriamiento_power_up_saltar.start()
	fuerza_salto = impulso * 0.9

func saltar_de_power_up_volar():
		audio_salto.play()
		animacion.play("jump")
		movimiento.y += fuerza_salto

func volar():
	saltar_de_power_up_volar()
	animacion_personaje.play("volar")
	enfriamiento_power_up_volar.start()
	aceleracion_caida = aceleracion_caida_power_up

func caer():
	if not is_on_floor():
		animacion.play("jump")
		movimiento.y += aceleracion_caida
		movimiento.y = clamp(movimiento.y,fuerza_salto,velocidad.y)

func colision_techo():
	if is_on_ceiling():
		movimiento.y = fuerza_rebote

func caida_al_vacio():
	if position.y > camara.limit_bottom:
		respawn()

func respawn():
	DatosPlayer.restar_vidas()
	animacion_personaje.play("oscurecer")
	if DatosPlayer.vidas != 0:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()

func impulsar():
	movimiento.y = impulso


func _on_EnfriamientoPowerUp_timeout():
	fuerza_salto = fuerza_salto_original
	
func _on_EnfriamientoPowerUpVolar_timeout():
	aceleracion_caida = aceleracion_caida_original
	animacion_personaje.play("default")

func play_entrar_portal(posicion_portal):
	puede_moverse = false
	$AnimationPlayer.play("entrar_portal")
	$Tween.interpolate_property(
		self,
		"global_position",
		global_position,
		posicion_portal,
		0.8,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
		)
		
	$Tween.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entrar_portal":
		animacion_personaje.play("oscurecer")
