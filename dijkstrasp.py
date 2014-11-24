#!/usr/bin/env python
from collections import deque
from pprint import pprint

graph = {'S': [('V', 1), ('W', 4)],
         'V': [('S', 1), ('W', 2), ('T', 6)],
         'W': [('S', 4), ('V', 2), ('T', 3)],
         'T': [('W', 3), ('V', 6)]}

# X in tutorial
seen = []

# distance from starting point - A in tutorial
dist = {}

# computed shortest path - B in tutorial
# unneeded for real implementation
sp = {}


def dijk(graph, start):
    dist[start] = 0
    sp[start] = None

    cur = start
    while sorted(graph.keys()) != sorted(seen):
        unvisited = {}
        for node in graph[cur]:
            print "yup", node[1]
            if node not in seen:
                new_distance = dist[cur] + node[1]
                print "NEW DIST", new_distance
                if new_distance < dist.get(node,float('inf')):
                    dist[node[0]] = new_distance
        seen.append(cur)
        unvisited = {}
        for node in graph[cur]:
            if node not in seen:
                unvisited[node] = dist.get(node,float('inf'))
        for node 
        for k in graph.keys():
            if k not in seen:
                print k, " not in seen, appending!"
                seen.append(k)
    #for node in graph:
    #    print node

    #print "SPSTART", sp[start]
    #ts = graph[start][0][1]   # temp shortest
    #nn = None  # next node
    #print "TS!", ts
    #for node in graph[start]:
    #    print node[0], " // dist: ", node[1]
    #    dist[node[0]] = node[1]
    #    if node[1] <= ts:
    #        nn = node[0]
    #print "Next node is: ", nn
    #dijk(graph, nn)

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
