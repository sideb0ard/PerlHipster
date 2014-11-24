def print_path(start, end, pred):
    if end == start:
        print start
    elif not pred[end]:
        print "No path from", start, "to", end
    else:
        print_path(start, pred[end], pred)
        print end
