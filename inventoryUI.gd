extends NinePatchRect

var states = 0 #0=main,1=livingthings,2=terrain,3=buildings,4=plants,5=tools
var page = 0
#Main page: state0,page0 | 
var buttons = []

func _ready():
	for child in get_children():
		buttons.append(child)
	buttons[0].pressed.connect(self._pressed0)

func _pressed0():
	pass

func _pressed1():
	pass

func _pressed2():
	pass

func _pressed3():
	pass

func _pressed4():
	pass

func scrollLeft():
	pass

func scrollRight():
	pass

func setStateMain():
	pass
