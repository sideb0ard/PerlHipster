#!/usr/bin/env python
import grafutilz

graph = {'s': {'a': 2, 'b': 1},
         'a': {'s': 3, 'b': 4, 'c': 1},
         'b': {'s': 4, 'a': 2, 'd': 2},
         'c': {'a': 2, 'd': 7, 't': 4},
         'd': {'b': 1, 'c': 11, 't': 5},
         't': {'c': 3, 'd': 5}}

# data structs
seen = []  # for nodes with Shortest Path already determined
dist = {}  # distance
pred = {}  # predecessors
q = {}  # MIN PRIORITY QUEUE KEYED BY D VALUE


def djk(graph, start):

    #################
    # initialize single source
    for node in graph:
        dist[node] = 999999
        pred[node] = []
    dist[start] = 0
    #################

    # add all Vertices to Min Priority Q, keyed with distance
    for node in graph:
        q[node] = dist[node]

    print "Q:", q
    # main loop
    while len(q) > 0:
        u = min(q, key=q.get)
        print "U is", u
        seen.append(u)
        del q[u]
        for v in graph[u]:
            # this is called Relaxation in intro to algo book
            new_dist = dist[u] + graph[u][v]
            if new_dist < dist[v]:
                dist[v] = new_dist
                pred[v] = u

    print "SEEN:", seen
    print "DIST:", dist
    print "Q:", q


def main():
    print "STEARTUP, YO!"
    djk(graph, 's')
    for p in graph.keys():
        print "Path from start to", p
        grafutilz.print_path('S', p, pred)

if __name__ == "__main__":
    main()
