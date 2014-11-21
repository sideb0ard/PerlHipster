#!/usr/bin/env python
from collections import deque
from pprint import pprint

graph = {'S': ['A', 'B'],
         'A': ['S', 'C'],
         'B': ['S', 'D'],
         'C': ['A', 'B', 'D', 'E'],
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

exploreq = deque([])


# goal - dist(v) - the fewest # of edges on path from s to v
def bfs(graph, start):
    seen[start] = True
    exploreq.append(start)
    while len(exploreq) > 0:
        v = exploreq.popleft()
        print "Looking at", v
        for node in graph[v]:
            if seen[node] is False:
                print "havnet seen", node, " marking as Explored"
                seen[node] = True
                exploreq.append(node)


def shortest_path(graph, start):
    seen[start] = True
    exploreq.append(start)
    while len(exploreq) > 0:
        v = exploreq.popleft()
        print "Looking at", v
        if v == start:
            dist[v] = 0
        for node in graph[v]:
            if seen[node] is False:
                print "havnet seen", node, " marking as Explored"
                seen[node] = True
                dist[node] = dist[v] + 1
                exploreq.append(node)


def main():
    print "MAINE"
    shortest_path(graph, 'S')
    print "DONE!"
    print "Distances are:"
    pprint(dist)

if __name__ == "__main__":
        main()
