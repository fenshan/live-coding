"kaixo jendea".postln;

s.boot;
().play;

p = ProxySpace.push;

p //evaluar

().play; // vuelve a hacer un sonido

// cuando queremos hacer un sonido, normalmente usamos el MÉTODO .play.
// Igual que hicimos con .postln, .play le dice a supercollider qué hacer
// con la información que le hemos dado.
// Si no le damos información sobre lo que debe tocar, tocará el sonido
// por defecto, que es lo que acabmos de oír.

// es buena idea dar nombres a los sonidos para poder acceder a ellos más tarde
~alicia = {};
// cualquier cosa entre los corchetes ahora se llama ~alice.
// digámos a ~alicia qué es lo que debe tocar
~alicia = {SinOsc.ar * 0.5}; ~alicia.play;
~alicia = {Saw.ar(freq:100, phase:0, mul: 0.1 )}; ~alicia.play;


~alicia.stop;
//~alicia.clear; //borra lo que hay dentro de los corchetes de alicia

//paneles:
s.scope(2);
s.meter;
ProxyMixer(p);

p.fadeTime = 2; // unidad en segundos


~andrea = { Saw.ar( [100, 200, 400, 801], 0.1 ) }; ~andrea.play;
// Si el sonido tiene más de 2 notas, pero sólo tenemos 1 canal, podemos mezclarlos
~andrea = { Mix(Saw.ar( [100, 200, 400, 801], 0.1 )) }; ~andrea.play;
// También podemos repartir las notas en el espectro estéreo
~andrea = { Splay.ar(Saw.ar( [100, 200, 400, 801], 0.1 )) }; ~andrea.play;
~andrea.stop;

~filtro_bea = {Saw.ar([700, 800], 0.1)}; ~filtro_bea.play;
//sintesis sustractiva
~filtro_bea = {RLPF.ar(Saw.ar([700, 800], 0.1), 800, 0.2, 1)}; ~filtro_bea.play;


//sintesis de modulacion
p.clear
//cambiar amplitud
~ba = {SinOsc.ar(400, mul: 1 * ~be)};
//cambiar freq
~ba = {SinOsc.ar(500 * ~be.ar, mul:0.1)};

~be = {SinOsc.ar(1).range(0, 1)};
~be = {SinOsc.ar(1)};

~ba.play;
~be.play;


{LFPulse.ar()}.plot //dibujar esta funcion

//funcion que modifica su fase con su propia definicion
//~a2.ar = {SinOsc.ar(200) * 0.1}
~a = {SinOsc.ar(200, ~a.ar) * 0.1}; a.play;



[1, 1]
1!4
"a"!4

(
SynthDef(\fensound, {
	//primero canal por el que sale el sonido. 0 es el izq
	Out.ar(0, SinOsc.ar(100) * 0.1);
}).add
)
//los paréntesis de fuera sirven para que con cmd+enter se evalúe todo lo que hay dentro

a = Synth(\fensound)
a.free
p.pop



(
SynthDef(\fensoundv, { |freq=200, amp=0.1, gate=1|
	var sig, env;
	sig = SinOsc.ar(freq);
	//envolvente
	//cada vez que reciba el gate (pulsar tecla) dispara la envolvente
	//doneaction hay que ponerlo a 2 para que cuando acabe la envolvente libere el sonido y no se pete
	env = EnvGen.kr(Env.perc, gate, doneAction:2);
	//sonido
	Out.ar(0, env * sig * amp);
}).add //store en vez de add para que se guarde
)

a = Synth(\fensoundv, [freq: 500])
a.free

(
Pdef(\pat_alo, Pbind(
	\instrument, \fensoundv,
	\amp, 0.5,
	//\dur, 1/4,
	\dur, Pseq ([1, 1/2], inf),
	\degree, Pseq([0, 2, 4], inf),
	\cutoff, Pbrown(200, 5000, 100)
)).play
)

Loopier.livecode
Loopier.controls(\acid)

(
Pdef(\pat_alo, Pbind(
	\instrument, \fensoundv,
	\amp, 0.5,
	\dur, 1/4,
	\degree, Pseq([0, 1b, 1s], inf),
)).play
)


















