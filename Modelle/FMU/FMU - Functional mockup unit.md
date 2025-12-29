
Kry tutoriaal hiervoor uit:

https://www.youtube.com/watch?v=sWsF-VtZWw4&list=PL3hDILqdU6Z5tKTtmiEoLRiZD6QsohtbK&index=22

Maak 'n FMU van 'n paraboliese vergelyking:

$$
y = 9x^2 + 2x + 5
$$

Die wortels van hierdie vergelyking is:

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

waar

$$
y = ax^2 + bx + c
$$

```math
a = 9
b = 2
c = 5

# Minimum x
x1 = (-b + (b^2 - 4*a*c)^0.5)/(2*a)
x2 = (-b - (b^2 - 4*a*c)^0.5)/(2*a)

```

In hierdie geval is die wortels imaginêr.

Die minimum van die vergelyking is waar die gradiënt 0 is.

$$
\frac{dy}{dx} = 0 = 18x + 2
$$

Dus kan $x = \frac{-2}{18}$ en die minimum waarde van $y$ is:

```math
a = 9
b = 2
c = 5
x = -2/18
y = a*x^2 + b*x + c
```

Export die funksie van die parabool uit openmodelica na 'n FMU.

![[ExportFMU.png]]

Trek die FMU in Hopsan en optimeer.  Sit die ramp funksie by.
Dit is egter nie geskik om 'n funksie te minimeer nie.  Dit is meer geskik om die parameters van 'n model te optimeer.  Maar hieronder is die algemene prosedure om so 'n optimering te doen:

![[FMU in Hopsan.png]]

![[Optimeer.png]]

![[Optimeringsalgoritme.png]]

![[Insetparameter.png]]
![[Doelfunksie.png]]