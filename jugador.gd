extends RigidBody3D

var mouse_sensibilidad := 0.001
var izder_mov := 0.0
var arrab_mov := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var input = Input.get_action_strength("ui_up")
	#apply_central_force(input * Vector3.FORWARD *  1200.0 * delta)
	var input = Vector3.ZERO
	input.x = Input.get_axis("mover_izquierda","mover_derecha")
	input.z = Input.get_axis("mover_adelante", "mover_atras")
	apply_central_force(input * 1200.0 * delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	$izq_derecha.rotate_y(izder_mov)
	$izq_derecha/arriba_abajo.rotate_x(arrab_mov)

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			izder_mov = - event.relative.x * mouse_sensibilidad
			arrab_mov = - event.relative.y * mouse_sensibilidad
