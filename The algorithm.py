
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Node:
    def __init__(self, val, children):
        self.val = val
        self.children = children



"""
"""
def preorder(self, root: 'Node'):
        res = []
        s =[]
        if not root:
            return res
        s.append(root)
        while s:
            tmp = s.pop()
            res.append(tmp.val)
            
            for child in tmp.children[::-1]:
                s.append(child)
        return res


def isR(instructions: str):
	direction = 0
	x = 0
	y = 0
	for i in instructions:
		if i == "L":
			direction -= 1
		elif i == "R":
			direction += 1
		else:
			print(direction)
			direction = direction % 4
			# print(direction)
	pass

def isRobotBounded( instructions: str):
        direction = 0
        x = 0
        y = 0
        for i in instructions:
            if i == 'L':
                direction -= 1
            elif i == 'R':
                direction += 1
            else:
                direction%=4
                print(direction)
                if direction == 0:
                    y += 1
                elif direction == 1:
                    x += 1
                elif direction == 2:
                    y -= 1
                else:
                    x -= 1

        return direction % 4 != 0 or (x == 0 and y == 0)


# isR("RLLGLRRRRGGRRRGLLRRR")
# print(isRobotBounded("RLLGLRRRRGGRRRGLLRRR"))

num = -5
num %= 4
print(num)
