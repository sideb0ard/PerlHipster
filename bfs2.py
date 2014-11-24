#!/usr/bin/env python
from collections import deque
import grafutilz

graph = {'R': ['V', 'S'],
         'S': ['R', 'W'],
         'T': ['W', 'X', 'U'],
         'U': ['T', 'X', 'Y'],
         'V': ['R'],
         'W': ['S', 'T', 'X'],
         'X': ['W', 'T', 'U', 'Y'],
         'Y': ['X', 'T', 'U']}

# data structs
color = {}  # WHITE=not seen, GRAY partially explored, BLACK fully
d = {}  # distance
pred = {}  # predecessors
q = deque([])


def bfs(graph, start):

    # initialize values
    for node in graph:
        color[node] = 'WHITE'
        d[node] = 'inf'
        pred[node] = []

    # set start values
    color[start] = 'GRAY'
    d[start] = 0
    q.append(start)

    # main loop
    while len(q) > 0:
        u = q.popleft()
        print "Looking at", u
        for v in graph[u]:
            if color[v] == 'WHITE':
                color[v] = 'GRAY'
                d[v] = d[u] + 1
                pred[v] = u
                q.append(v)
        color[u] = 'BLACK'

    print "RESULTS::"
    print "Colors:", color
    print "Distance:", d
    print "Parent:", pred


def main():
    print "STEARTUP, YO!"
    bfs(graph, 'S')
    for p in graph.keys():
        print "Path from start to", p
        grafutilz.print_path('S', p, pred)

if __name__ == "__main__":
    main()
