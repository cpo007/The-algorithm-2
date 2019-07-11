
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


def levelOrder(self, root: 'Node'):


	