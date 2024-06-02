# katex-macro-preprocessor

Preprocess KaTeX macros in a markdown file.

- How it works?:
  By replacing them using regex.
- Status:
  - ok: gdef without arguments
  - ng: gdef with arguments
  - ng: def
  - ng: newcommand
  - ng: renewcommand

> [!WARNING]
> This is a very experimental project and may not work in serveral cases.

## How to use

Prerequisites:

- opam

Installation:

```bash
git clone https://github.com/sano-jin/katex-pp.git
cd katex-pp
opam install .
dune build
```

Usage:

```bash
./run example/katex.md
```

## Example

```bash
./run example/katex.md
```

Input (example/katex.md):

```markdown
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
```

Output:

```markdown
略記法：

- $\overrightarrow{X}$ denotes $X_1, \dots, X_n$
- $\nu \overrightarrow{X}.G$ denotes $\nu X_1. \dots. \nu X_n.G$

欲しい定理は以下のようになる．

### 定理 1

$x[\overrightarrow{X}] : t(\overrightarrow{X})$
かつ
$x[\overrightarrow{X}] \equiv \nu \overrightarrow{W}. (z[\overrightarrow{Z}], y[\overrightarrow{Y}])$
なので

$$
\begin{array}{lcl}
dlist(Y, X) & \longrightarrow & X \bowtie Y\\
dlist(Y, X) & \longrightarrow & \nu Z1, Z2. (\mathrm{Cons}(Z1, Z2, X), 1(Z1), dlist(Y, Z2))
\end{array}
$$

あるいは
$\nu Z. (z[Z, X], \mathrm{Cons}(1, Y, Z)) : dlist(Y, X)$
```
