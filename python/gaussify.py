def gaussify(mat, ind):
  assert len(ind) == len(mat)
  assert all(len(mat[i]) == len(mat) for i in range(len(mat)))
  for j in range(0, len(mat) - 1):
    for i in range(j + 1, len(mat)):
      if mat[j][j] == 0: continue
      a = mat[i][j] / mat[j][j]
      mat[i][j] = 0
      for k in range(j + 1, len(mat[i])): mat[i][k] -= mat[j][k] * a
      ind[i] -= ind[j] * a
  return mat, ind

def gaussify_pivot_partial(mat, ind):
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
      [1, 10, 10 ** 2, 10 ** 3, 10 ** 4, 10 ** 5],
      [1, 8, 8 ** 2, 8 ** 3, 8 ** 4, 8 ** 5],
      [1, 6, 6 ** 2, 6 ** 3, 6 ** 4, 6 ** 5],
      [1, 4, 4 ** 2, 4 ** 3, 4 ** 4, 4 ** 5],
      [1, 2, 2 ** 2, 2 ** 3, 2 ** 4, 2 ** 5],
      [1, 0, 0 ** 2, 0 ** 3, 0 ** 4, 0 ** 5],
    ]
ind = [119, 74.3, 39.6, 14.8, 2.9, 0]

a, b = gaussify(mat, ind)
for i in range(0, len(a)):
  print(" ".join(map(str, a[i])))
print()
print(b)
print()

coeff = solve(a, b)
print(coeff)

a0, a1, a2, a3, a4, a5 = coeff
sol = a0 + a1 * 7.5 + a2 * (7.5)**2 + a3 * (7.5)**3 + a4 * (7.5)**4 + a5 * (7.5)**5
print(sol)
