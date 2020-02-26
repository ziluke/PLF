'''
a.) Substitute the i-th element from a list with a value v

substitute(l1...ln, i, v) = - []                              , n=0
                            - v U l2...ln                     , i=0
                            - l1 U substitute(l2...ln, i-1, v), i>0

'''


def isEmpty(list):
    if not list:
        return True


def addFirst(v, list):
    return [v] + list


def firstElement(list):
    return list[0]


def sublist(list):
    return list[1:]


def substitute(list, i, v):
    if isEmpty(list) is True:
        return list
    if i == 0:
        return addFirst(v, sublist(list))
    elif i > 0:
        return [firstElement(list)] + substitute(sublist(list), i - 1, v)


'''
b.) Determine the difference of 2 sets represented as lists

difference(l1...ln, a1...am)= - []                               , n=0
                              - l1...ln                          , m=0
                              - difference(l2...ln, a2...am)     , l1 = a1
                              - l1 U difference(l2...ln, a1...am), l1 != a1
'''


def differnece(list1, list2):
    if isEmpty(list1) is True:
        return []
    if isEmpty(list2) is True:
        return list1
    if firstElement(list1) == firstElement(list2):
        return differnece(sublist(list1), sublist(list2))
    else:
        return [firstElement(list1)] + differnece(sublist(list1), list2)


if __name__ == '__main__':
    l = [1, 2, 3, 4, 5, 6]
    a1 = [2, 5, 6, 8]
    a2 = []
    a3 = [7, 8]
    v = 4
    print(substitute(l, 9, v))
    print(substitute(l, 2, v))
    print(substitute([], 2, v))

    print(differnece(l, a1))
    print(differnece(l, a2))
    print(differnece([], a1))
    print(differnece(l, a3))
