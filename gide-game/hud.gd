extends CanvasLayer

signal start_game

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func _on_message_timer_timeout() -> void:
	$MessageLabel.hide()
	
func show_game_over():
	show_message("GAME OVER")
	await $MessageTimer.timeout
	$MessageLabel.text = "COCK BREAKER"
	$MessageLabel.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	update_score(0)
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()
