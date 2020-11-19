s.boot

s.quit

(
SynthDef(\blip, { arg freq = 300, dur = 0.2, amp = 1.0;
	var sound = SinOsc.ar([freq,freq]);
	sound = sound * Line.kr(1,0,dur,doneAction:2);
	Out.ar(0,sound * amp);
}).add
)

(
OSCFunc.newMatching( { arg msg;
	var freq = msg[1];
	var amp = msg[2];
	Synth(\blip, [\freq, freq, \amp, amp]);
}, "/blip/play")
)

OSCFunc.trace


