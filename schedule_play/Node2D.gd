extends Node2D

func _ready():	
	var mix_time_usec: int = AudioServer.get_last_mix_time_usec() / 1000000
	for i in range(0, 5):
		var ap: AudioStreamPlayer = get_node("AudioStreamPlayer").duplicate()
		add_child(ap)
		ap.owner = owner
		ap.play()
		ap.scheduled_time = mix_time_usec + _generate_time(mix_time_usec, i)

func _generate_time(mix_time_usec, times) -> int:
	var interval: float = 1
	var next_audio_event: float = interval * times
	print("Scheduling at mix time " + str(mix_time_usec) + " at " + str(next_audio_event))
	return next_audio_event
