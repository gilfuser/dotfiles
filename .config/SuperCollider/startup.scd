q = q ? ();

"kill server first".postln;
/*
Task {
	Server.killAll;
	0.2.wait
}.play(AppClock);
*/

"\n**********  loading serverConfig:  **********".postln;

// Server.supernova;
// Server.default = s = Server.local;
// more latency gives more accurate timing and quantizing. Less latency gives better instrument feeling with imediate response
s.latency = 0.25;
s.options
	.numAudioBusChannels_(128 * 16)	 // for proxy usage: lots of ar bus space 1024
	.memSize_(8192 * 256)		 // 512 MB This memory is used to allocate synths! 64
	.maxNodes_(1024 * 32)		 // lots of synth nodes  16
	.numWireBufs_(64 * 32)			 // fat synthdefs need lots of interconnects
    .numOutputBusChannels_(2)
    .numBuffers_(1024 * 256)
// .device_("Fireface 400 (297)")	// device name
    .numInputBusChannels_(2)
// .blockSize_(64)					//  .kr bus rate, default is 64 samples
                                    //  32 samples makes possible lower latency
// .hardwareBufferSize_(128)		// take fastest power of two hardware allows
;
/*s.waitForBoot({
	s.sync;
	// MIDIClient.init;
	s
	.recChannels_(2)			// record stereo out only
    .recSampleFormat_("float"); // in float to recover from clipping
	s.sync;
	q.postServerOptions = {
	"********** Server info : **********".postln;
	"s.name: % \n"
	"s.address: % \n"
	"s.latency: % \n"
	.postf(s.name, s.addr, s.latency);
	"server options:".postln;
	s.options.dump;
	"********************".postln;
	"serverConfig loaded.".postln;
	"********************".postln;
	"MIDI client initiated.".postln;
	"********************".postln;
};
	//"/home/gilfuser/SuperCollider/algoraveSP/_0_StartUp.scd".load
});*/

// scnvim
if (\SCNvim.asClass.notNil) {
    Server.default.doWhenBooted {
        \SCNvim.asClass.updateStatusLine(1, 9670);
    }
}
