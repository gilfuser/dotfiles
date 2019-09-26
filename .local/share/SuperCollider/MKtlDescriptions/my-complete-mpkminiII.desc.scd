// contributed by gil fuser
/*
* todo:
* test on osx
m.free;
MKtl.find(\midi);
m = MKtl(\mpk2, "akai-mpkmini2");
m.gui;
m.explore;
MIDIExplorer.verbose = true;
MIDIExplorer.verbose = false; // turn it off again
m.explore(false);
m.createDescriptionFile;
MKtl(\x, "*mpk*2").gui;
m.trace;
m.trace(false);
*/
"my customized description version, with all the programs mapped, according to my own edit in MPK MiniMKII editor".postln;
(
deviceName: "MPKmini2",
protocol: 'midi',
deviceType: 'midiKeyboard',
elementTypes: [\knob, \key, \pad, \bend],
status: (
	linux: "tested and working",
	osx: "tested desc only, looks ok, no gui info yet. 2016-03-17, adc",
	win: "tested and working"),

idInfo: "MPKmini2",

deviceInfo: (
	vendorURI: 'http://www.akaipro.com/product/mpk-mini-mkii',
	manualURI: 'http://6be54c364949b623a3c0-4409a68c214f3a9eeca8d0265e9266c0.r0.cf2.rackcdn.com/988/documents/MPK%20mini%20-%20User%20Guide%20-%20v1.0.pdf',
	features: [\pianoKey, \pad, \knob, \bender],
	notes:
	"Uses only ```Program 1```.\n"
	"To use the other programs use first: [MPK MiniMKII editor](http://www.akaipro.com/product/mpk-mini-mkii#downloads)\n"
	"avoiding more mapping overlaping as occours in the defaults.\n"
	"Accidental ```Prog-Change``` activation on the device needs to be reverted by ```Bank A/B```.\n",
	longName: "AKAI MPKmini mk2"
),

elementsDesc: (
	elements:[

		///////////// PROGRAM 1 /////////////
		(
			key: \p0,
			shared: (page: 0),
			elements:
			[

				// ------ pad BANK A note on-off-------------
				(
					key: \pnA,
					shared: ( elementType: \pad, midiChan: 0, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							shared: ( midiNum: i, style:( row: (i div:4), column: 2 + (i % 4)) )
						)
					}
				),

				// ------ pad BANK B note on-off -------------
				(
					key: \pnB,
					shared: ( elementType: \pad, midiChan: 0, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							shared: ( midiNum: num, style:( row: 2.25 + (i div:4), column: 2 + (i % 4)) )
						)
					}
				),

				// ------ pad BANK A cc -------------
				(
					key: \pcA,
					shared: ( midiChan: 0, midiMsgType: \cc, elementType: \pad, spec: \midiCC ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i,
							style:( row: 4.5 + (i div:4), column: 2 + (i % 4))
						)
					}
				),

				// ------ pad BANK B cc -------------
				(
					key: \pcB,
					shared: ( elementType: \pad, midiChan: 0, spec: \midiCC, \ioType: \inout, midiMsgType: \cc ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							midiNum: num,
							style:( row: 6.75 + (i div:4), column: 2 + (i % 4))
						)
					}
				),


				// ------ knob -------------
				(
					key: \k,
					shared: ( elementType: \knob, midiChan: 4, spec: \midiCC, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i, style:( row: i div:4, column: 6 + (i % 4) ),
						)
					}
				),

				//////// piano key //////////
				(
					key: \pkey,
					shared: ( midiChan: 4, elementType: \pianoKey, groupType: \noteOnOff, spec: \midiVel ),
					elements:
					(0..120).collect { |i|
						var pos = Piano.pos( i % 25, 0);
						(
							key: i.asSymbol,
							shared: (
								midiNum: i, groupType: \noteOnOff,
								style: (
									row: ( i div: 25 * 1.5 ) + (pos.y * 0.6),
									column: 10 + (pos.x * 0.65 % 25),
									color: pos.color,
									width: 0.9,
									height: 0.75,
								)
							)
						)
					}
				),
				// ------- bend ------------
				( key: \bYup,
					midiChan: 4, \midiNum: 30, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 0, column:0.5, width: 0.84, height: 1.75 )
				),
				( key: \bX,
					midiChan: 4, midiMsgType: \bend, elementType: \xfader, spec: \midiBend, style: (row: 1.66, column:0, width: 1.9 )
				),
				( key: \bYdn,
					midiChan: 4, \midiNum: 31, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 2.5, column:0.5, width: 0.84, height: 1.75 )
				),
			]
		),

		///////////// PROGRAM 2 /////////////
		(
			key: \p1,
			shared: (page: 1),
			elements:
			[

				// ------ pad BANK A note on-off-------------
				(
					key: \pnA,
					shared: ( elementType: \pad, midiChan: 1, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							shared: ( midiNum: i, style:( row: (i div:4), column: 2 + (i % 4) ) )
						)
					}
				),

				// ------ pad BANK B note on-off -------------
				(
					key: \pnB,
					shared: ( elementType: \pad, midiChan: 1, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							shared: ( midiNum: num, style:( row: 2.25 + (i div:4), column: 2 + (i % 4)) )
						)
					}
				),

				// ------ pad BANK A cc -------------
				(
					key: \pcA,
					shared: ( elementType: \pad, midiChan: 1, spec: \midiCC, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i,
							style:( row: 4.5 + (i div:4), column: 2 + (i % 4))
						)
					}
				),

				// ------ pad BANK B cc -------------
				(
					key: \pcB,
					shared: ( elementType: \pad, midiChan: 1, spec: \midiCC, \ioType: \inout, midiMsgType: \cc ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							midiNum: num,
							style:( row: 6.75 + (i div:4), column: 2 + (i % 4))
						)
					}
				),


				// ------ knob -------------
				(
					key: \k,
					shared: ( elementType: \knob, midiChan: 5, spec: \midiCC, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i, style:( row: i div:4, column: 6 + (i % 4) ),
						)
					}
				),

				//////// piano key //////////
				(
					key: \pkey,
					shared: ( midiChan: 5, elementType: \pianoKey, groupType: \noteOnOff, spec: \midiVel ),
					elements:
					(0..120).collect { |i|
						var pos = Piano.pos( i % 25, 0);
						(
							key: i.asSymbol,
							shared: (
								midiNum: i, groupType: \noteOnOff,
								style: (
									row: ( i div: 25 * 1.5 ) + (pos.y * 0.6),
									column: 10 + (pos.x * 0.65 % 25),
									color: pos.color,
									width: 0.9,
									height: 0.75,
								)
							)
						)
					}
				),
				// ------- bend ------------
				( key: \bYup,
					midiChan: 5, \midiNum: 30, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 0, column:0.5, width: 0.84, height: 1.75 )
				),
				( key: \bX,
					midiChan: 5, midiMsgType: \bend, elementType: \xfader, spec: \midiBend, style: (row: 1.66, column:0, width: 1.9 )
				),
				( key: \bYdn,
					midiChan: 5, \midiNum: 31, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 2.5, column:0.5, width: 0.84, height: 1.75 )
				),
			]
		),

		///////////// PROGRAM 3 /////////////
		(
			key: \p2,
			shared: (page: 2),
			elements:
			[

				// ------ pad BANK A note on-off-------------
				(
					key: \pnA,
					shared: ( elementType: \pad, midiChan: 2, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							shared: ( midiNum: i, style:( row: (i div:4), column: 2 + (i % 4) ) )
						)
					}
				),

				// ------ pad BANK B note on-off -------------
				(
					key: \pnB,
					shared: ( elementType: \pad, midiChan: 2, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: (i+1).asSymbol,
							shared: ( midiNum: num, style:( row: 2.25 + (i div:4), column: 2 + (i % 4)) )
						)
					}
				),

				// ------ pad BANK A cc -------------
				(
					key: \pcA,
					shared: ( elementType: \pad, midiChan: 2, spec: \midiVel, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i,
							style:( row: 4.5 + (i div:4), column: 2 + (i % 4))
						)
					}
				),

				// ------ pad BANK B cc -------------
				(
					key: \pcB,
					shared: ( elementType: \pad, midiChan: 2, spec: \midiVel, \ioType: \inout, midiMsgType: \cc ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							midiNum: num,
							style:( row: 6.75 + (i div:4), column: 2 + (i % 4))
						)
					}
				),


				// ------ knob -------------
				(
					key: \k,
					shared: ( elementType: \knob, midiChan: 6, spec: \midiCC, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i, style:( row: i div:4, column: 6 + (i % 4) )
						)
					}
				),

				//////// piano key //////////
				(
					key: \pkey,
					shared: ( midiChan: 6, elementType: \pianoKey, groupType: \noteOnOff, spec: \midiVel ),
					elements:
					(0..120).collect { |i|
						var pos = Piano.pos( i % 25, 0);
						(
							key: i.asSymbol,
							shared: (
								midiNum: i, groupType: \noteOnOff,
								style: (
									row: ( i div: 25 * 1.5 ) + (pos.y * 0.6),
									column: 10 + (pos.x * 0.65 % 25),
									color: pos.color,
									width: 0.9,
									height: 0.75,
								)
							)
						)
					}
				),
				// ------- bend ------------
				( key: \bYup,
					midiChan: 6, \midiNum: 30, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 0, column:0.5, width: 0.84, height: 1.75 )
				),
				( key: \bX,
					midiChan: 6, midiMsgType: \bend, elementType: \xfader, spec: \midiBend, style: (row: 1.66, column:0, width: 1.9 )
				),
				( key: \bYdn,
					midiChan: 6, \midiNum: 31, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 2.5, column:0.5, width: 0.84, height: 1.75 )
				),
			]
		),

		///////////// PROGRAM 4 /////////////
		(
			key: \p3,
			shared: (page: 3),
			elements:
			[

				// ------ pad BANK A note on-off-------------
				(
					key: \pnA,
					shared: ( elementType: \pad, midiChan: 3, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							shared: ( midiNum: i, style:( row: (i div:4), column: 2 + (i % 4) ) )
						)
					}
				),

				// ------ pad BANK B note on-off -------------
				(
					key: \pnB,
					shared: ( elementType: \pad, midiChan: 3, spec: \midiVel, midiMsgType: \noteOn, groupType: \noteOnOffBut ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							shared: ( midiNum: num, style:( row: 2.25 + (i div:4), column: 2 + (i % 4)) )
						)
					}
				),

				// ------ pad BANK A cc -------------
				(
					key: \pcA,
					shared: ( elementType: \pad, midiChan: 3, spec: \midiVel, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i,
							style:( row: 4.5 + (i div:4), column: 2 + (i % 4))
						)
					}
				),

				// ------ pad BANK B cc -------------
				(
					key: \pcB,
					shared: ( elementType: \pad, midiChan: 3, spec: \midiVel, \ioType: \inout, midiMsgType: \cc ),
					elements: ( 8..15 ).collect{ |num, i|
						(
							key: i.asSymbol,
							midiNum: num,
							style:( row: 6.75 + (i div:4), column: 2 + (i % 4))
						)
					}
				),


				// ------ knob -------------
				(
					key: \k,
					shared: ( elementType: \knob, midiChan: 7, spec: \midiCC, midiMsgType: \cc ),
					elements: ( 0..7 ).collect{ |i|
						(
							key: i.asSymbol,
							midiNum: i, style:( row: i div:4, column: 6 + (i % 4) )
						)
					}
				),

				//////// piano key //////////
				(
					key: \pkey,
					shared: ( midiChan: 7, elementType: \pianoKey, groupType: \noteOnOff, spec: \midiVel ),
					elements:
					(0..120).collect { |i|
						var pos = Piano.pos( i % 25, 0);
						(
							key: i.asSymbol,
							shared: (
								midiNum: i, groupType: \noteOnOff,
								style: (
									row: ( i div: 25 * 1.5 ) + (pos.y * 0.6),
									column: 10 + (pos.x * 0.65 % 25),
									color: pos.color,
									width: 0.9,
									height: 0.75,
								)
							)
						)
					}
				),
				// ------- bend ------------
				( key: \bYup,
					midiChan: 7, \midiNum: 30, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 0, column:0.5, width: 0.84, height: 1.75 )
				),
				( key: \bX,
					midiChan: 7, midiMsgType: \bend, elementType: \xfader, spec: \midiBend, style: (row: 1.66, column:0, width: 1.9 )
				),
				( key: \bYdn,
					midiChan: 7, \midiNum: 31, midiMsgType: \cc, elementType: \slider, spec: \midiCC, style: (row: 2.5, column:0.5, width: 0.84, height: 1.75 )
				),
			]
		),
	]

)
);

