// https://hydra.ojack.xyz/
// pruebas de fenshan

s0.initCam();
src(s0)
	.rotate(0, 0.2)
	.repeatX(3.0, 0.0)
	.repeatY(2.0, 0.0)
	.kaleid([4, 5, 6, 5].fast(3))
	.saturate(2)
	// 	.add(o0, -0.1)
	// 	.invert()
	// 	.diff(src(o0))
	.out(o0);

// s0.initScreen(); src(s0).out(o0);
// osc().out(o1);
// shape(4).rotate(2, 1).scale(0.5).out();
// osc().add(shape(), [1, 0.5, 0, 0.5]).out(o1);
// src(o0).add(o1).out(o2);
// solid(1, 0.7, 1).out(o1);
// noise().out(o1);

shape()
	.rotate(0, 0.5)
	.color(1, 0, 0) //activar y desactivar esto queda muy guay
	// 	.diff(src(o1).color(1, 0, 0), 0.5)
	// 	.diff(src(o1).color(1, 0.5, 0), 0.5)
	// 	.diff(src(o1).color(1, 1, 0), 0.5)
	// 	.diff(src(o1).color(0, 1, 0), 0.5)
	.diff(src(o1)
		.color(0, 1, 1), 0.5)
	// 	.diff(src(o1).color(0.5, 0, 1), 0.5)
	.out(o1);

// pi = 3.1415
// osc()
// 	.rotate(pi / 4, 0)
// 	.color([1, 0, 1], [0, 1, 1], 0) //el azul no modifica nada
// 	.out(o2);
// shape(4)
// 	.modulate(o2, 0.03)
// 	.out(o3);

src(o0)
	.diff(o1)
	.out(o2);

a.show()
a.setBins(6)
a.setScale(2)

shape(4)
	.scale(() => a.fft[1] + 0.01)
	.out(o3);


// render(o0);
render(o3);
render();











