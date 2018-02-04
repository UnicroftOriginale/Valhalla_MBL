extends Control

func _ready():
	# Called every time the node is added to the scene.
	NetCode.connect("connection_failed", self, "_on_connection_failed")
	NetCode.connect("connection_succeeded", self, "_on_connection_success")
	NetCode.connect("player_list_changed", self, "refresh_lobby")
	NetCode.connect("game_ended", self, "_on_game_ended")
	NetCode.connect("game_error", self, "_on_game_error")

func _on_host_pressed():
	if (get_node("ConnectionMenu/Name").text == ""):
		get_node("ConnectionMenu/ErrorLabel").text="Invalid name!"
		return

	get_node("ConnectionMenu").hide()
	get_node("PlayerMenu").show()
	get_node("ConnectionMenu/ErrorLabel").text=""

	var player_name = get_node("ConnectionMenu/Name").text
	NetCode.host_game(player_name)
	refresh_lobby()

func _on_join_pressed():
	if (get_node("ConnectionMenu/Name").text == ""):
		get_node("ConnectionMenu/ErrorLabel").text="Invalid name!"
		return

	var ip = get_node("ConnectionMenu/Ip").text
	if (not ip.is_valid_ip_address()):
		get_node("ConnectionMenu/ErrorLabel").text="Invalid IPv4 address!"
		return

	get_node("ConnectionMenu/ErrorLabel").text=""
	get_node("ConnectionMenu/Host").disabled=true
	get_node("ConnectionMenu/Join").disabled=true

	var player_name = get_node("ConnectionMenu/Name").text
	NetCode.join_game(ip, player_name)
	# refresh_lobby() gets called by the player_list_changed signal

func _on_connection_success():
	get_node("ConnectionMenu").hide()
	get_node("PlayerMenu").show()

func _on_connection_failed():
	get_node("ConnectionMenu/Host").disabled=false
	get_node("ConnectionMenu/Join").disabled=false
	get_node("ConnectionMenu/ErrorLabel").set_text("Connection failed.")

func _on_game_ended():
	show()
	get_node("ConnectionMenu").show()
	get_node("PlayerMenu").hide()
	get_node("ConnectionMenu/Host").disabled=false
	get_node("ConnectionMenu/Join").disabled

func _on_game_error(errtxt):
	get_node("ErrorPopup").dialog_text = errtxt
	get_node("ErrorPopup").popup_centered_minsize()

func refresh_lobby():
	var players = NetCode.get_player_list()
	players.sort()
	get_node("PlayerMenu/PlayerList").clear()
	get_node("PlayerMenu/PlayerList").add_item(NetCode.get_player_name() + " (You)")
	for p in players:
		get_node("PlayerMenu/PlayerList").add_item(p)

	get_node("PlayerMenu/Start").disabled=not get_tree().is_network_server()

func _on_start_pressed():
	NetCode.begin_game()
