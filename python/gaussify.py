def gaussify(mat, ind):
  assert len(ind) == len(mat)
  assert all(len(mat[i]) == len(mat) for i in range(len(mat)))
  for j in range(0, len(mat) - 1):
    for i in range(j + 1, len(mat)):
      a = mat[i][j] / mat[j][j]
      mat[i][j] = 0
      for k in range(j + 1, len(mat[i])): mat[i][k] -= mat[j][k] * a
      ind[i] -= ind[j] * a
  return mat, ind

def guassify_pivot_partial(mat, ind):
  assert len(ind) == len(mat)
  assert all(len(mat[i]) == len(mat) for i in range(len(mat)))
  for j in range(0, len(mat) - 1):
    mc = max(range(len(mat)), key=lambda x: mat[x][j])
    if mc != j: mat[mc], mat[j], ind[mc], ind[j] = mat[j], mat[mc], ind[j], ind[mc]
    for i in range(j + 1, len(mat)):
      a = mat[i][j] / mat[j][j]
      mat[i][j] = 0
      for k in range(j + 1, len(mat[i])): mat[i][k] -= mat[j][k] * a
      ind[i] -= ind[j] * a
  return mat, ind

def solve(mat, ind):
  assert all(len(mat[i]) == len(mat) for i in range(len(mat)))
  x = [None] * len(mat)
  for i in range(len(mat) - 1, -1, -1):
    s = sum([mat[i][j] * x[j] for j in range(i + 1, len(mat[i]))])
    x[i] = (ind[i] - s) / mat[i][i]
  return x

# mat = [
#     [1, 3, 0],
#     [0, 1, 4],
#     [2, 3, -2],
#   ]
# ind = [1, 1, 1]
#
# a, b = gaussify(mat, ind)
# for i in range(0, len(a)):
#   print(" ".join(map(str, a[i])))
# print()
# print(b)
# print()
#
# print(solve(a, b))

mat = [
      [1, 2, 0, 9],
      [3, 9, 1, 3],
      [6, 3, 1, 3],
      [2, 5, 2, 7]
    ]
ind = [1, 2, 3, 4]

a, b = guassify_pivot_partial(mat, ind)
for i in range(0, len(a)):
  print(" ".join(map(str, a[i])))
print()
print(b)
print()

print(solve(a, b))
