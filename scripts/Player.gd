# Player.gd
extends CharacterBody2D

# --- Exported variables allow you to tweak these values from the editor ---
@export var speed: float = 200.0
# Define your play area as a Rect2: position (top-left) and size (width, height)

# The player's current move direction (starts moving right)
var move_direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	# -- Direction Switching --
	# Only update the direction if a movement key is pressed.
	# (The player always moves in the current direction if no key is pressed.)
	if Input.is_action_pressed("ui_right"):
		move_direction = Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		move_direction = Vector2.LEFT
	elif Input.is_action_pressed("ui_up"):
		move_direction = Vector2.UP
	elif Input.is_action_pressed("ui_down"):
		move_direction = Vector2.DOWN

	# -- Movement --
	# Calculate the velocity vector and move the player.
	velocity = move_direction * speed
	move_and_slide()
