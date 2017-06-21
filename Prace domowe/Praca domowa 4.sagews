#GRA KOLONEL BLOTTO
# S = 6
# Mozliwe strategie:  (1,1,4), (1,2,3), (2,2,2)

import numpy as np

matrix = np.array([[0, 0, 1], [0, 0, 0], [-1, 0, 0]])
matrix1 = matrix.shape[0]
matrix2 = matrix.shape[1]

new_col = [[-1]]*matrix1
new_row = np.append([[1]*matrix1], [[0]], axis=1)
matrix3 = matrix.transpose()
matrix3 = np.append(matrix3, new_col, axis=1)
matrix3 = np.append(matrix3, new_row, axis=0)

x = [0]*matrix1
y = [0]*matrix2
x.append(1)
y.append(1)

variable = [">="]*matrix1
variable.append("")
constraint = [">="]*matrix2
constraint.append("==")

final = InteractiveLPProblem(matrix3, x, y, constraint_type = constraint, variable_type = variable)
show(final)
show(final.standard_form().run_simplex_method())
