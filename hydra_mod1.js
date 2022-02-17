// Puertas III
// por Celeste Betancur
// https://github.com/essteban

// modified by Fen Nicolás
// https://github.com/fenshan

osc(40,0.2, () => a.fft[3] * 0.7 + 1)
  .modulateScale(osc(40,0,1).kaleid(8))
  .repeat(2,4)
  .modulate(o0,0.05)
  .modulateKaleid(shape(4,0.1,1))
  .rotate(0, 0.3)
  .scale(() => a.fft[0] * 0.04 + 1)
  .out(o0)

a.show()
a.setBins(6)
a.setScale(2)
