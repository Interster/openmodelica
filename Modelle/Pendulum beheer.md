'n Pendulum wat beheer word met 'n borsellose motor.

Hier is die vryliggaamdiagram van die pendulum:

![[BeheerPendulumVryliggamDiagram]]
Neem die som van momente rondom die rotasiepunt:

$$
\sum T = Ix_2
$$
Die som van die draaimomente is:

$$
T = u(t) - \mathbf{sgn}(x_1) \cdot T_w - MgL_{cg} \cdot cos(x_1)
$$

$u(t)$ is die draaimoment van die elektriese motor (positief antikloksgewys)
$T_w$ is die draaimoment a.g.v. wrywing, waar

$$
T_w = \mu F_N r_{laer} = \mu Mg r_{laer}
$$
waar
$\mu$ is die wrywingskoeffisient van die laer
$r_{laer}$ is die radius van die laer

Die elektriese motor draaimoment is:

$$
u = Ki
$$
waar
K is die motor konstante in $N.m/ampere$
$i$ is die stroom in $ampere$

Hier is die toestandsveranderlike model:

$$
\begin{align}
\dot{x_1} & = x_2 \\
\dot{x_2} & = \frac{u - \mathbf{sgn}(x_1) \cdot T_w - MgL_{cg} \cdot cos(x_1)}{I} \\
y & = x_1
\end{align}
$$
waar 
$x_1(t)$ die pendulum hoek is m.b.t. die horisontale lyn (positief antikloksgewys)
$x_2(t)$ die pendulum hoeksnelheid is (positief antikloksgewys)

Die deler hierbo mag nie energie skep nie, dus moet die volgende voorwaarde geld:

$$
\mathbf{abs}(u - MgL_{cg} \cdot cos(x_1)) > \mathbf{abs}(- \mathbf{sgn}(x_1) \cdot T_w)
$$


