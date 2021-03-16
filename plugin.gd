tool
extends EditorPlugin

var multistart_button: Button
var instance_count = 2


func _enter_tree():
	multistart_button = Button.new()
	multistart_button.text = "Multistart"

	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, multistart_button)


func _ready():
	multistart_button.connect("button_down", self, "launch_multiplayer_setup")


func _exit_tree():
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, multistart_button)


func launch_multiplayer_setup():
	get_editor_interface().play_main_scene()

	for i in range(instance_count):
		var window_pos = "%s,%s" % [8 * i, (8 * i) + 64]
		OS.execute(OS.get_executable_path(), ["--path", ".", "--position", window_pos], false)
