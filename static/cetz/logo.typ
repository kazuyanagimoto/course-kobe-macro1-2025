#import "@preview/cetz:0.3.4"
#set page(width: auto, height: auto, margin: .5cm)

#let red = rgb("e16462")
#let orange = rgb("f89441")
#let blue = rgb("0d0887")
#let indigo = rgb("5601a4")
#let gray = rgb("ced4da")

#cetz.canvas(length: 3cm,{
  import cetz.draw: *

  polygon((0, 0), 6, angle: 90deg, stroke: orange + 5pt)
  line((-0.2, 0.85), (-0.2, -0.85), stroke: gray + 1.5pt)
  catmull((-calc.sqrt(3) / 2 + 0.05, -0.25), (0.1, 0.2), (calc.sqrt(3) / 2 - 0.05, -0.25), stroke: gray + 1.5pt)
  catmull((-0.75, -0.5), (-0.2, 0.1), (0.1, 0.8), stroke: blue + 2.5pt)
  mark((-0.45, -0.2), (0.5, 0.7), symbol: "straight", stroke: blue + 2pt, scale: 2)
  mark((-0.05, 0.4), (-0.4, -0.5), symbol: "straight", stroke: blue + 2pt, scale: 2)
  
  line((0.25, -0.5), (0, -0.5), stroke: red + 1.5pt, mark: (end: "straight"))
  line((0.25, -0.5), (0.25, -0.25), stroke: red + 1.5pt, mark: (end: "straight"))

  line((-0.65, 0.45), (-0.4, 0.45), stroke: red + 1.5pt, mark: (end: "straight"))
  line((-0.65, 0.45), (-0.65, 0.2), stroke: red + 1.5pt, mark: (end: "straight"))

  content((0.35, -0.6), angle: 30deg,
          text(fill: indigo, weight: "bold", font: "Josefin Sans")[Macroeconomics])
  
})