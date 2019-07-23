
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


def guess(num):
	pick = 6
	if num == pick:
		return 0
	elif num > pick:
		return 1
	else:
		return -1



def guessNum(n):
	arr = [1,n]

	num = int((arr[0] + arr[1]) / 2)
	status = guess(num)

	while status != 0:
		if status == 1 :
			arr = [arr[0],num]
		elif status == -1 :
			arr = [num,arr[1]]
		num = int((arr[0] + arr[1]) / 2)
		status = guess(num)
	print(num)

guessNum(10)

def firstBadVersion(n):
	left = 1
	right = n
	isFirst = False

	while isFirst == False:
		version = int((left + right) / 2)
		if isBadVersion(version):
			if isBadVersion(version - 1):
				right = version - 1
			else:
				isFirst = True
				return version
		else:
			left = version + 1
	return 0





