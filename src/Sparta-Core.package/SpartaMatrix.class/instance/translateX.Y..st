transformations
translateX: px Y: py


" multiply receiver by translation matrix :

| sx   shx   x   |        | 1  0  px |             |	sx  shx  (sx*px + shx*py + x) |
| shy sy     y   |   *   | 0  1  py |   ===> | shy  sy  (shy*px + sy*py + y)  |
|  0     0     1   |       | 0  0   1  |             |  0     0    1  |

"
	x := px "(sx*px) + (shx*py)" + x.
	y := py "(shy*px) + (sy*py)" + y.
