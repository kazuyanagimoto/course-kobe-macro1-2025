#import "@preview/cetz:0.3.4": canvas, draw, tree

#set page(width: auto, height: auto, margin: .5cm)

#canvas({
  import draw: *

  circle((-3, 0))
  circle((3, 0))
  content((-3, 0), text(size: 1.5em)[E])
  content((3, 0), text(size: 1.5em)[U])
  
  line((-1.5, 0.3), (1.5, 0.3), mark: (end: "straight"))
  line((-1.5, -0.3), (1.5, -0.3), mark: (start: "straight"))
  content((0, 0.6), [Prob. $sigma$ ])
  content((0, -0.6), [Prob. $lambda$ ])
})