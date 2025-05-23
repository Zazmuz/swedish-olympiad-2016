import sys
import random

if len(sys.argv) != 5:
    print('Wrong number of arguments')
    sys.exit(1)

(n_max, k_max, xy_max, seed) = [int(s) for s in sys.argv[1:]]
solver_path = "./solver"


random.seed(seed)

k = random.randrange(0, k_max)
n = random.randrange(0, n_max)


def write_output(houses, k):
    s = str(len(houses)) + " " + str(k) + '\n'
    for house in houses:
        s += str(house[0]) + " " + str(house[1]) + '\n'
    return s.strip()


def column(x, ymin, ymax):
    assert((ymax - ymin) % 4 == 0)
    res = []
    y = ymin
    while y < ymax:
        res.append((x, y))
        res.append((x + 1, y + 2))
        y += 4
    return res

print(write_output(column(0, 0, min(n // 2, xy_max // 4) * 4), k))
