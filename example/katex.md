略記法：

$\gdef\X*{\overrightarrow{X}}$
$\gdef\Y*{\overrightarrow{Y}}$
$\gdef\Z*{\overrightarrow{Z}}$
$\gdef\W*{\overrightarrow{W}}$
$\gdef\Cons{\mathrm{Cons}}$

- $\X*$ denotes $X_1, \dots, X_n$
- $\nu \X*.G$ denotes $\nu X_1. \dots. \nu X_n.G$

欲しい定理は以下のようになる．

### 定理 1

$x[\X*] : t(\X*)$
かつ
$x[\X*] \equiv \nu \W*. (z[\Z*], y[\Y*])$
なので

$$
\begin{array}{lcl}
dlist(Y, X) & \longrightarrow & X \bowtie Y\\
dlist(Y, X) & \longrightarrow & \nu Z1, Z2. (\Cons(Z1, Z2, X), 1(Z1), dlist(Y, Z2))
\end{array}
$$

あるいは
$\nu Z. (z[Z, X], \Cons(1, Y, Z)) : dlist(Y, X)$
