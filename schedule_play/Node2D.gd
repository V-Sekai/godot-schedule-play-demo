extends Node2D

func _ready():	
	var mix_time: int = AudioServer.get_last_mix_time_usec()
	for i in range(0, 5):
		var ap: AudioStreamPlayer = get_node("AudioStreamPlayer").duplicate()
		add_child(ap)
		ap.owner = owner
		ap.scheduled_time_usec = mix_time + _generate_time(mix_time, i)
		ap.play()

func _generate_time(mix_time, times) -> int:
	var interval_usec: int = 2e6
	var next_audio_event: int = interval_usec * times
	print("Scheduling at mix time " + str(mix_time) + " at " + str(next_audio_event))
	return next_audio_event
