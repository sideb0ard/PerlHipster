#!/usr/bin/env python
#graph = {'s': {'a': 2, 'b': 1},
#         'a': {'s': 3, 'b': 4, 'c': 1},
#         'b': {'s': 4, 'a': 2, 'd': 2},
#         'c': {'a': 2, 'd': 7, 't': 4},
#         'd': {'b': 1, 'c': 11, 't': 5},
#         't': {'c': 3, 'd': 5}}

graph = {'s': {'v': 1, 'w': 4},
         'v': {'w': 2, 't': 6},
         'w': {'t': 3},
         't': {}}
# data structs
X = []  # for nodes with Shortest Path already determined // X in video
A = {}  # Aance // A in video
B = {}


def djk(graph, start):

    #################
    # initialize single source
    for node in graph:
        A[node] = 999999
    X.append(start)
    A[start] = 0
    B[start] = []
    #################

    # WHILE X != V (V is all vertices)
    print "G is ", graph
    for v in X:
        temp_d = 999999
        for u in graph[v]:
            if u not in X:
                if graph[v][u] < temp_d:
                    next_u = u
                    temp_d = graph[v][u]
        if next_u not in X:
            A[next_u] = A[v] + graph[v][next_u]
            X.append(next_u)

    print "X:", X
    print "A:", A


def main():
    print "STEARTUP, YO!"
    djk(graph, 's')

if __name__ == "__main__":
    main()
