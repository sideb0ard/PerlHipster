#!/usr/bin/env python
from collections import deque
from pprint import pprint

graph = {'S': ['A', 'B'],
         'A': ['S', 'A', 'C'],
         'B': ['S', 'A', 'D'],
         'C': ['A', 'D', 'E'],
         'D': ['B', 'C', 'E'],
         'E': ['C', 'D']}

seen = {'S': False,
        'A': False,
        'B': False,
        'C': False,
        'D': False,
        'E': False}

# distance from starting point
dist = {'S': None,
        'A': None,
        'B': None,
        'C': None,
        'D': None,
        'E': None}


# goal - dist(v) - the fewest # of edges on path from s to v
def dfs(graph, start):
    seen[start] = True
    for v in graph[start]:
        if seen[v] is False:
            print "havnet seen", v, " Exploring!"
            dfs(graph, v)


def main():
    print "MAINE"
    dfs(graph, 'S')
    print "DONE!"
    print "Distances are:"
    pprint(dist)

if __name__ == "__main__":
        main()
