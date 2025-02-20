extends Line2D

@export var min_distance: float = 5.0

# We'll remember the parent's last recorded position so we only add new points 
# once we've moved "min_distance" pixels from the last point.
var last_position: Vector2

func _ready() -> void:
	# Start with an empty set of points.
	points = []
	# Record the initial position of the parent.
	last_position = get_parent().global_position
	add_point(last_position)

func _process(delta: float) -> void:
	# Get the parent's (e.g. Player) current global position.
	var current_position = get_parent().global_position
	
	# Only add a new point if we've moved far enough from the last point.
	if current_position.distance_to(last_position) >= min_distance:
		add_point(current_position)
		last_position = current_position
