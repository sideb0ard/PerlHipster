#!/usr/bin/env python

def popmin(pqueue):
    lowest = 1000
    keylowest = None
    for key in pqueue:
        if pqueue[key] < lowest:
            lowest = pqueue[key]
            keylowest = key
    del pqueue[keylowest]
    return keylowest

def dijkstra(graph, start):
    pqueue = {} # priority queue
    dist = {}
    pred = {} # predecessor

    for v in graph:
        dist[v] = 1000
        pred[v] = -1
    dist[start] = 0
    for v in graph:
        pqueue[v] = dist[v]

    while pqueue:
        u = popmin(pqueue)
        for v in graph[u].keys():
            w = graph[u][v]
            newdist = dist[u] + w
            if (newdist < dist[v]):
                pqueue[v] = newdist
                dist[v] = newdist
                pred[v] = u

    return dist, pred

graph = {"A": {"B":6, "C":8},
        "B" : {"E":11},
        "C" : {"D": 9},
        "D" : {},
        "E": {"F":3},
        "F" : {"B": 7, "E":4}}

dist, pred = dijkstra(graph, "A")
print "Predecessors in shortest path:"
for v in pred: print "%s: %s" % (v, pred[v])
print "Shortest distance from each vertex:"
for v in dist: print "%s: %s" % (v, dist[v])


        
