extends NinePatchRect

var state = 0 #0=main,1=livingthings,2=buildings,3=plants,4=tools

var buttons = []

func _ready():
	for child in get_children():
		buttons.append(child)
	for button in buttons:
		if button.name == "backButton":
			button.pressed.connect(self.back)
		elif button.name == "rightScrollButton":
			button.pressed.connect(self.scrollRight)
			button.visible = false
		elif button.name == "leftScrollButton":
			button.pressed.connect(self.scrollLeft)
			button.visible = false
		elif button.name == "Button":
			button.pressed.connect(self.button1)
		elif button.name == "Button2":
			button.pressed.connect(self.button2)
		elif button.name == "Button3":
			button.pressed.connect(self.button3)
		elif button.name == "Button4":
			button.pressed.connect(self.button4)

func back():
	state = 0

func button1():
	if state == 0:
		pass #Got to category, change icons and prefabs of all other buttons
	elif state == 4:
		pass # Change camera USING, selected = empty
	else:
		pass # change camera selected

func button2():
	if state == 0:
		pass
	elif state == 4:
		pass
	else:
		pass

func button3():
	if state == 0:
		pass
	elif state == 4:
		pass
	else:
		pass

func button4():
	if state == 0:
		pass
	elif state == 4:
		pass
	else:
		pass

func scrollLeft():
	pass

func scrollRight():
	pass

