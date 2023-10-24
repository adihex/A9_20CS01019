from tree_parsing import Tree
from pptree import *

list_tree = [
    {"id": 1, "parent": 0},
    {"id": 2, "parent": 0},
    {"id": 3, "parent": 0},
    {"id": 4, "parent": 0},
]

tr = Tree(id_key="id", parent_key="parent", parent_start="0", child_key="children")

tree = tr.tree_from_list(list_tree)

print(tr)
