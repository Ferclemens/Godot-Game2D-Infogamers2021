extends Node2D


var puede_disparar = true

onready var detectar_jugador = $Sprite/RayCast2D
onready var posiciones_disparos = $Sprite/PosicionesDisparos
onready var cadencia_disparo = $Timer
onready var sfx_rayos = $Rayos

export var rayo: PackedScene


# warning-ignore:unused_argument
func _process(_delta):
	if detectar_jugador.is_colliding() and puede_disparar:
		disparar()
		puede_disparar = false
		cadencia_disparo.start()

func disparar():
	sfx_rayos.play()
	for posicion in posiciones_disparos.get_children():
		var nuevo_rayo = rayo.instance()
		nuevo_rayo.crear(posicion.global_position)
		owner.get_node("RayosLanzados").add_child(nuevo_rayo)	

func _on_Timer_timeout():
	puede_disparar = true
