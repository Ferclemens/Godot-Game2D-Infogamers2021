extends KinematicBody2D

var movimiento = Vector2.ZERO
var fuerza_salto_original
var aceleracion_caida_original
var puede_moverse = true

export var velocidad = Vector2(150.0,150.0)
export var aceleracion_caida = 400
export var fuerza_salto = 2200
export var fuerza_rebote = 350
export var impulso = -3800
export var aceleracion_caida_power_up = 140
onready var animacion = $AnimatedSprite
onready var audio_salto = $audio_jump
onready var camara = $Camera2D
onready var enfriamiento_power_up_saltar = $EnfriamientoPowerUpSalto
onready var enfriamiento_power_up_volar = $EnfriamientoPowerUpVolar
onready var animacion_power_up_volar = $AnimationPlayer
 
func _physics_process(delta):
	movimiento.x = velocidad.x * tomar_direccion()
	move_and_slide(movimiento, Vector2.UP)
	saltar()
	caer()
	colision_techo()
	caida_al_vacio()

func _ready():
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
	animacion_power_up_volar.play("volar")
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
	get_tree().reload_current_scene()

func impulsar():
	movimiento.y = impulso


func _on_EnfriamientoPowerUp_timeout():
	fuerza_salto = fuerza_salto_original
	
func _on_EnfriamientoPowerUpVolar_timeout():
	aceleracion_caida = aceleracion_caida_original
	animacion_power_up_volar.play("default")

func play_entrar_portal(posicion_portal):
	puede_moverse = false
	$AnimationPlayer.play("entrar_portal")




