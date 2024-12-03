extends Node3D

@onready var sun: DirectionalLight3D = $DirectionalLight3D
@onready var environment: WorldEnvironment = $WorldEnvironment

# Day/night cycle duration in seconds
@export var cycle_duration = 120.0  # 2 minutes for a full cycle

# Internal variables
var time_elapsed = 0.0
var sun_light

func _ready():
	# Cache the DirectionalLight node
	sun_light = sun

func _process(delta):
	# Update the time elapsed
	time_elapsed += delta
	if time_elapsed > cycle_duration:
		time_elapsed -= cycle_duration  # Loop the cycle

	# Calculate the sun's rotation
	var cycle_progress = time_elapsed / cycle_duration
	var sun_angle = lerp(-90, 270, cycle_progress)  # -90° to 270° arc for sunrise to sunset
	sun_light.rotation_degrees.x = sun_angle

	# Compute the sun intensity based on the angle
	var sun_intensity = clamp(cos(deg_to_rad(sun_angle)), 0.0, 1.0)  # Ranges from 0 to 1
	sun_light.light_energy = lerp(0.1, 2.0, sun_intensity)  # Adjust min/max intensity as needed

	# Adjust sky energy based on sun intensity
	if environment.environment:
		var env = environment.environment  # Get the Environment resource
		var sky = env.sky  # Access the Sky resource
		if sky and sky is PanoramaSkyMaterial:  # Check if it's a ProceduralSky
			sky.sky_energy = lerp(0.5, 2.0, sun_intensity)  # Adjust sky brightness
