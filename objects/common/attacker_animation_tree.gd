extends AnimationTree

@export var attacking_nodes : Array[Node3D]

@onready var state_machine : AnimationNodeStateMachinePlayback = get("parameters/playback")
@onready var puppet : CharacterBody3D = get_parent().get_parent()

var attacking := false

func _ready():
	for node in attacking_nodes:
xxxxxxxx		node.connect("is_attacking", set_attacking)

func _physics_process(_delta):
	var velocity = puppet.velocity
	
	handle_animations(velocity)

func handle_animations(velocity: Vector3):
	if attacking:
		attacking = false
		state_machine.travel("gun_attack")
	else:
		if velocity.length() >= 0.5:
			state_machine.travel("walk")
		else:
			state_machine.travel("idle")

func set_attacking():
	attacking = true
	pass
