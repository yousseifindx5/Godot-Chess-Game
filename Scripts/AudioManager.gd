extends Node

var music_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer
var btn_player: AudioStreamPlayer

const BG_MUSIC = preload("res://Assets/Sounds/bg_music.mp3")
const MOVE_SFX = preload("res://Assets/Sounds/move_sfx.mp3")
const BTN_SFX = preload("res://Assets/Sounds/click_btn_sfx.mp3")

var sfx_volume: float = 1.0
var music_volume: float = 1.0

func _ready():
	music_player = AudioStreamPlayer.new()
	sfx_player = AudioStreamPlayer.new()
	btn_player = AudioStreamPlayer.new()
	add_child(music_player)
	add_child(sfx_player)
	add_child(btn_player)
	music_player.stream = BG_MUSIC
	music_player.stream.loop = true
	music_player.volume_db = linear_to_db(music_volume)
	music_player.play()

func play_move():
	sfx_player.stream = MOVE_SFX
	sfx_player.volume_db = linear_to_db(sfx_volume)
	sfx_player.play()

func play_btn():
	btn_player.stream = BTN_SFX
	btn_player.volume_db = linear_to_db(sfx_volume)
	btn_player.play()

func set_music_volume(value: float):
	music_volume = value
	music_player.volume_db = linear_to_db(value) if value > 0 else -80.0
	if value > 0 && !music_player.playing:
		music_player.play()
	elif value == 0:
		music_player.stop()

func set_sfx_volume(value: float):
	sfx_volume = value
	sfx_player.volume_db = linear_to_db(value)

func stop_music():
	music_player.stop()

func start_music():
	if !music_player.playing:
		music_player.play()
