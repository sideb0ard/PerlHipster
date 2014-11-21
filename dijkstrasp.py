#!/usr/bin/env python
from collections import deque
from pprint import pprint

graph = {'S': [('V', 1), ('W', 4)],
         'V': [('S', 1), ('W', 2), ('T', 6)],
         'W': [('S', 4), ('V', 2), ('T', 3)],
         'T': [('W', 3), ('V', 6)]}

# X is tutorial
seen = {'S': False,
        'V': False,
        'W': False,
        'T': False}

# distance from starting point - A in tutorial
dist = {'S': 0,
        'V': 0,
        'W': 0,
        'T': 0}

# computed shortest path - B in tutorial
# unneeded for real implementation
sp = {'S': [],
      'V': [],
      'W': [],
      'T': []}


def dijk(graph, start):
    dist[start] = 0
    sp['S'] = None

    seen[start] = True
    print "SPSTART", sp[start]
    ts = graph[start][0][1]   # temp shortest
    nn = None  # next node
    print "TS!", ts
    for node in graph[start]:
        print node[0], " // dist: ", node[1]
        dist[node[0]] = node[1]
        if node[1] <= ts:
            nn = node[0]
    print "Next node is: ", nn
    dijk(graph, nn)

    # if seen[node] is False:


def main():
    print "MAINE"
    dijk(graph, 'S')
    print "DONE!"
    print "Distances are:"
    pprint(dist)
    pprint(sp)

if __name__ == "__main__":
        main()
