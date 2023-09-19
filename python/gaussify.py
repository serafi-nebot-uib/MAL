def gaussify(mat, ind):
  for j in range(0, len(mat) - 1):
    for i in range(j + 1, len(mat)):
      a = mat[i][j] / mat[j][j]
      mat[i][j] = 0
      for k in range(j + 1, len(mat[i])): mat[i][k] -= mat[j][k] * a
      ind[i] -= ind[i - 1] * a
  return mat, ind

def solve(mat, ind):
  x = [None] * len(mat)
  for i in range(len(mat) - 1, -1, -1):
    s = sum([mat[i][j] * x[j] for j in range(i + 1, len(mat[i]))])
    x[i] = (ind[i] - s) / mat[i][i]
  return x

mat = [
      [3, 2, 3, 4],
      [4, 4, 3, 2],
      [1, 4, 4, 3],
      [2, 3, 1, 1]
    ]
ind = [3, 5, 2, 4]

a, b = gaussify(mat, ind)
for i in range(0, len(a)):
  print(" ".join(map(str, a[i])))
print()
print(solve(a, b))
