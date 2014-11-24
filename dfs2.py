#!/usr/bin/env python
from collections import deque

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
d = {}  # ttime discovered
f = {}  # ttime finished
pred = {}  # predecessors
ttime = 0


def dfs(graph):

    # initialize values
    for node in graph:
        color[node] = 'WHITE'

    for node in graph:
        if color[node] == 'WHITE':
            dfs_visit(node)


def dfs_visit(node):
    global ttime
    color[node] = 'GRAY'
    ttime = ttime + 1
    d[node] = ttime
    for v in graph[node]:
        if color[v] == 'WHITE':
            pred[v] = node
            dfs_visit(v)
    color[node] = 'BLACK'
    ttime = ttime + 1
    f[node] = ttime


def main():
    print "STEARTUP, YO!"
    dfs(graph)
    print "DONE!"
    print "RESULTZ::"
    print color
    print d
    print f

if __name__ == "__main__":
    main()
