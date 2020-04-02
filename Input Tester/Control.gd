extends Control

onready var InputKey = $MarginContainer/VBoxContainer/InputEventKey
onready var InputAction = $MarginContainer/VBoxContainer/InputEventAction
onready var InputMouse = $MarginContainer/VBoxContainer/InputEventMouse
onready var InputMouseButton = $MarginContainer/VBoxContainer/InputEventMouseButton
onready var InputMouseMotion = $MarginContainer/VBoxContainer/InputEventMouseMotion
onready var InputGesture = $MarginContainer/VBoxContainer/InputEventGesture
onready var InputMagnifyGesture = $MarginContainer/VBoxContainer/InputEventMagnifyGesture
onready var InputPanGesture = $MarginContainer/VBoxContainer/InputEventPanGesture
onready var InputJoypadButton = $MarginContainer/VBoxContainer/InputEventJoypadButton
onready var InputJoypadMotion = $MarginContainer/VBoxContainer/InputEventJoypadMotion
onready var InputScreenDrag = $MarginContainer/VBoxContainer/InputEventScreenDrag
onready var InputScreenTouch = $MarginContainer/VBoxContainer/InputEventScreenTouch
onready var InputMIDI = $MarginContainer/VBoxContainer/InputEventMIDI

func _input(event):
	$MarginContainer/VBoxContainer/AsText/Result.text = event.as_text()
	$MarginContainer/VBoxContainer/ActionType/Result.text = str(event.is_action_type())
	$MarginContainer/VBoxContainer/GetDevice/Result.text = str(event.get_device())
	$MarginContainer/VBoxContainer/IsPressed/Result.text = str(event.is_pressed())
	
	var type: String = ""
	if event is InputEventAction:
		InputAction.visible = true
		type += "InputEventAction "
		$MarginContainer/VBoxContainer/InputEventAction/GetAction/Result.text = str(event.get_action())
	else:
		InputAction.visible = false
	
	if event is InputEventWithModifiers:
		type += "InputEventWithModifiers "
	
	if event is InputEventKey:
		InputKey.visible = true
		type += "InputEventKey "
		$MarginContainer/VBoxContainer/InputEventKey/Scancode/Result.text = str(event.scancode)
		$MarginContainer/VBoxContainer/InputEventKey/Unicode/Result.text = str(event.unicode)
	else:
		InputKey.visible = false
	
	if event is InputEventMouse:
		InputMouse.visible = true
		type += "InputEventMouse "
		$MarginContainer/VBoxContainer/InputEventMouse/button_mask/Result.text = str(event.button_mask)
		$MarginContainer/VBoxContainer/InputEventMouse/global_position/Result.text = str(event.global_position)
		$MarginContainer/VBoxContainer/InputEventMouse/position/Result.text = str(event.position)
	else:
		InputMouse.visible = false
	
	if event is InputEventMouseButton:
		InputMouseButton.visible = true
		type += "InputEventMouseButton "
		$MarginContainer/VBoxContainer/InputEventMouseButton/button_index/Result.text = str(event.button_index)
		$MarginContainer/VBoxContainer/InputEventMouseButton/doubleclick/Result.text = str(event.doubleclick)
		$MarginContainer/VBoxContainer/InputEventMouseButton/factor/Result.text = str(event.factor)
	else:
		InputMouseButton.visible = false

	if event is InputEventMouseMotion:
		InputMouseMotion.visible = true
		type += "InputEventMouseMotion "
		#$MarginContainer/VBoxContainer/InputEventMouseMotion/pressure/Result.text = str(event.pressure)
		$MarginContainer/VBoxContainer/InputEventMouseMotion/relative/Result.text = str(event.relative)
		$MarginContainer/VBoxContainer/InputEventMouseMotion/speed/Result.text = str(event.speed)
		#$MarginContainer/VBoxContainer/InputEventMouseMotion/tilt/Result.text = str(event.tilt)
	else:
		InputMouseMotion.visible = false
	
	if event is InputEventGesture:
		InputGesture.visible = true
		type += "InputEventGesture "
		$MarginContainer/VBoxContainer/InputEventGesture/position/Result.text = str(event.position)
	else:
		InputGesture.visible = false
	
	if event is InputEventMagnifyGesture:
		InputMagnifyGesture.visible = true
		type += "InputEventMagnifyGesture "
		$MarginContainer/VBoxContainer/InputEventMagnifyGesture/factor/Result.text = str(event.factor)
	else:
		InputMagnifyGesture.visible = false
	
	if event is InputEventPanGesture:
		InputPanGesture.visible = true
		$MarginContainer/VBoxContainer/InputEventPanGesture/delta/Result.text = str(event.delta)
	else:
		InputPanGesture.visible = false

	if event is InputEventJoypadButton:
		InputJoypadButton.visible = true
		type += "InputEventJoypadButton "
		var index = event.button_index
		$MarginContainer/VBoxContainer/InputEventJoypadButton/button_index/Result.text = str(index)
		$MarginContainer/VBoxContainer/InputEventJoypadButton/pressed/Result.text = str(event.pressed)
		$MarginContainer/VBoxContainer/InputEventJoypadButton/pressure/Result.text = str(event.pressure)
		var device = event.device
		var known = Input.is_joy_known(device)
		$MarginContainer/VBoxContainer/InputEventJoypadButton/is_joy_known/Result.text = str(known)
		if known:
			$MarginContainer/VBoxContainer/InputEventJoypadButton/get_joy_name/Result.text = Input.get_joy_name(device)
			$MarginContainer/VBoxContainer/InputEventJoypadButton/get_joy_guid/Result.text = Input.get_joy_guid(device)
			var buttonName = Input.get_joy_button_string(index)
			$MarginContainer/VBoxContainer/InputEventJoypadButton/get_joy_button_string/Result.text = buttonName
			$MarginContainer/VBoxContainer/InputEventJoypadButton/get_joy_button_index_from_string/Result.text = str(Input.get_joy_button_index_from_string(buttonName))
	else:
		InputJoypadButton.visible = false
	
	if event is InputEventJoypadMotion:
		InputJoypadMotion.visible = true
		type += "InputEventJoypadMotion "
		$MarginContainer/VBoxContainer/InputEventJoypadMotion/axis/Result.text = str(event.axis)
		$MarginContainer/VBoxContainer/InputEventJoypadMotion/axis_value/Result.text = str(event.axis_value)
		$MarginContainer/VBoxContainer/InputEventJoypadMotion/get_joy_axis_string/Result.text = Input.get_joy_axis_string(event.axis)
	else:
		InputJoypadMotion.visible = false
	
	if event is InputEventScreenDrag:
		InputScreenDrag.visible = true
		type += "InputEventScreenDrag "
		$MarginContainer/VBoxContainer/InputEventScreenDrag/index/Result.text = str(event.index)
		$MarginContainer/VBoxContainer/InputEventScreenDrag/position/Result.text = str(event.position)
		$MarginContainer/VBoxContainer/InputEventScreenDrag/relative/Result.text = str(event.relative)
		$MarginContainer/VBoxContainer/InputEventScreenDrag/speed/Result.text = str(event.speed)
	else:
		InputScreenDrag.visible = false
	
	if event is InputEventScreenTouch:
		InputScreenTouch.visible = true
		type += "InputEventScreenTouch "
		$MarginContainer/VBoxContainer/InputEventScreenTouch/index/Result.text = str(event.index)
		$MarginContainer/VBoxContainer/InputEventScreenTouch/position/Result.text = str(event.position)
		$MarginContainer/VBoxContainer/InputEventScreenTouch/pressed/Result.text = str(event.pressed)
	else:
		InputScreenTouch.visible = false
	if event is InputEventMIDI:
		InputMIDI.visible = true
		type += "InputEventMIDI "
		$MarginContainer/VBoxContainer/InputEventMIDI/channel/Result.text = str(event.channel)
		$MarginContainer/VBoxContainer/InputEventMIDI/controller_number/Result.text = str(event.controller_number)
		$MarginContainer/VBoxContainer/InputEventMIDI/controller_value/Result.text = str(event.controller_value)
		$MarginContainer/VBoxContainer/InputEventMIDI/instrument/Result.text = str(event.instrument)
		$MarginContainer/VBoxContainer/InputEventMIDI/message/Result.text = str(event.message)
		$MarginContainer/VBoxContainer/InputEventMIDI/pitch/Result.text = str(event.pitch)
		$MarginContainer/VBoxContainer/InputEventMIDI/pressure/Result.text = str(event.pressure)
		$MarginContainer/VBoxContainer/InputEventMIDI/velocity/Result.text = str(event.velocity)
	else:
		InputMIDI.visible = false
	
	$MarginContainer/VBoxContainer/EventType/Result.text = type