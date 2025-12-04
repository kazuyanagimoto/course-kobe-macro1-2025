#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1"
#set page(width: auto, height: auto, margin: .5cm)

#let color_base = rgb("#107895")
#let color_accent = rgb( "#9a2515")


#show math.equation: block.with(fill: white, inset: 1pt)

#cetz.canvas(length: 3cm, {
  import cetz.draw: *
  import cetz.decorations: flat-brace
  import cetz-plot: *

  plot.plot(axis-style: "left", x-label: [$ t $], y-label: [$ y_t $],
            size: (3, 1), y-tick-step: none, x-tick-step: none,
            x-ticks: ((1, [$ t=1 $]), (2, [$ t=2 $]), (3, [$ t=3 $])),
            x-min: 0, y-min: 0, {

      plot.add(((1, 2.5), (1, 1.5)), style: (stroke: (dash: "dashed", paint: color_base)))
      plot.add(((2, 1.5), (1, 1.5)), style: (stroke: (dash: "dashed", paint: gray)))
      plot.add(((3, 4.5), (3, 1.5)), style: (stroke: (dash: "dashed", paint: color_accent)))
      plot.add(((2, 1.5), (3, 1.5)), style: (stroke: (dash: "dashed", paint: gray)))
      plot.add(((4, 1.5), (4, 4.5)), style: (stroke: (dash: "dashed", paint: color_accent)))
      plot.add(((4, 0.5), (4, 1.5)), style: (stroke: (dash: "dashed", paint: color_base)))

      plot.add(((1, 3), (2, 1), (3, 5)), mark: "x", mark-size: .05, style: (stroke: none), mark-style: (stroke: gray))


      plot.annotate({
        content((0.5, 2), text(fill: color_base)[$ tau_1 - tau_2 $])
        content((2.5, 3), text(fill: color_accent)[$ tau_3 - tau_2 $])
        content((5.5, 2.5), [$ ( #text(fill: color_accent)[$ tau_3 - tau_2 $] ) - ( #text(fill: color_base)[$ tau_2 - tau_1 $] ) $])
        flat-brace((4, 4.5), (4, 0.5), amplitude: .2)
        content((1.3, 3), text(fill: gray)[$ y_1 $])
        content((2.3, 1), text(fill: gray)[$ y_2 $])
        content((3.4, 5), text(fill: gray)[$ y_3 $])
        content((1.3, 2.4), [$ tau_1 $])
        content((2, 2.0), [$ tau_2 $])
        content((3.4, 4.4), [$ tau_3 $])
      })

      plot.add(((1, 2.5), (2, 1.5), (3, 4.5)), mark: "o", mark-size: .05, style: (stroke: none), mark-style: (stroke: black, fill: white))
  })
})