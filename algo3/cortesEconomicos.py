def cortesEconomicos(i,j,c):
    c.sort()
    ops=0
    def rec(i,j,cistart,ciend):
        if ciend < cistart:
            return 0
        values = []
        for index in range(cistart,ciend+1):
            valor = rec(i,c[index],cistart, index - 1) + rec(c[index],j,index + 1, ciend) + j - i
            values.append( valor )
        return min(values) 
    print(ops)
    return rec(i,j,0,len(c)-1)

print(cortesEconomicos(0,10,[2,3,7]))

def cortesEconomicosTD(i,j,c):
    c.sort()
    def rec(i,j,cistart,ciend):
        if ciend < cistart:
            return 0
        values = []
        for index in range(cistart,ciend+1):
            valor = rec(i,c[index],cistart, index - 1) + rec(c[index],j,index + 1, ciend) + j - i
            values.append( valor )
        return min(values) 
    return rec(i,j,0,len(c)-1)


def cortesEconomicosBU(i,j,c):
    c.append(i)
    c.append(j)
    c.sort()

    lc = len(c)
    memo = [ [0 for x in range(lc)] for x in range(lc) ]

    for y in range(lc):
        for x in range(lc):
            if y == x:
                memo[y][x] = 0
            else:
                pass
            if x == i and j == y:
                pass
