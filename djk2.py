#!/usr/bin/env python
# from http://geekly-yours.blogspot.com/2014/03/dijkstra-algorithm-python-example-source-code-shortest-path.html

def dijkstra(graph, src, dest, visited=[], distances={}, predecessors={}):
    if src not in graph:
        raise TypeError('The root of shortest path is not there - numpty!')
    if dest not in graph:
        raise TypeError('ooft')
    # ending condition for recursion
    if src == dest:
        path=[]
        pred=dest
        while pred != None:
            path.append(pred)
            pred=predecessors.get(pred,None)
        path.reverse()
        print('Shortest Path:' +str(path)+" cost="+str(distances[dest]))
    else:
        # if this is initial run, innit costs
        if not visited:
            distances[src] = 0
        for neighbor in graph[src]:
            if neighbor not in visited:
                new_distance = distances[src] + graph[src][neighbor]
                if new_distance < distances.get(neighbor,float('inf')):
                    distances[neighbor] = new_distance
                    predecessors[neighbor] = src
        # mark as visited
        visited.append(src)
        # all neighbors visited, recurse 
        unvisited={}
        for k in graph:
            if k not in visited:
                unvisited[k] = distances.get(k,float('inf'))
        x=min(unvisited, key=unvisited.get)
        dijkstra(graph,x,dest,visited,distances,predecessors)

if __name__ == "__main__":
    graph = {'s': {'a': 2, 'b': 1},
            'a': {'s':3, 'b': 4, 'c':1},
            'b': {'s':4, 'a': 2, 'd':2},
            'c': {'a': 2, 'd':7, 't':4},
            'd': {'b':1, 'c':11, 't':5},
            't': {'c':3, 'd': 5}}
    dijkstra(graph, 's','t')
