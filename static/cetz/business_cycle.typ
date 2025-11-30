#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1"
#set page(width: auto, height: auto, margin: .5cm)

#show math.equation: block.with(fill: white, inset: 1pt)

#let f_trend(x) = x + 0.5
#let f_cycle(x) = calc.sin(1.5 * calc.pi * x) / 2
#let f(x) = f_trend(x) + f_cycle(x)

#let x0 = calc.pi / 6
#let x1 = calc.pi / 3

#cetz.canvas(length: 3cm, {
  import cetz.draw: *
  import cetz-plot: *

  plot.plot(axis-style: "left", x-label: [$ t $], y-label: none,
            size: (2, 1), x-tick-step: none, y-tick-step: none, {
    plot.annotate({
      content((1.8, f_trend(1.5) + 0.1), text(size: 0.9em)[Trend])
      content((1.8, f(1.5) + 0.2), text(size: 0.9em)[Data])
      content((x0 - 0.1, f(x0) + 0.2), text(size: 0.8em)[Peak])
      content((x1 - 0.1, f(x1) - 0.25), text(size: 0.8em)[Trough])
      content((x0 + 0.15, f(1.7) + 0.2), text(size: 0.9em)[Recession])
      rect((x0 - 0.1, 0), (x1 - 0.1, f(1.7)), stroke: none, fill: rgb(21, 25, 29, 50))
    })
    plot.add(f, domain: (0., 1.6))
    plot.add(f_trend, domain: (0., 1.6), style: (stroke: (dash: "dashed")))
  })
})