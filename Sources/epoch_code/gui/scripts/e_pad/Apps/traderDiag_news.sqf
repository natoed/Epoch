private _newsArr = [
	"My dog was shot. That made me sad.",
	"Business has been quiet since word got out that sappers are in the area.",
	"Looters are expecting too much crypto for all the junk they bring in.",
	"What do I look like ? A newspaper vendor. Go Away.",
	"The sun came up again this morning.. That's good news I suppose.",
	"Keep your dog fed with raw or cooked carcasses.",
	"Sappers are known to be good for their pelts. Just don't get too close to one",
	"Some strange rumours that a Construct was seen in the mountains. Those are just bedtime stories to scare kids with.",
	"UAVs are a good source of components.",
	"Some say the nearby town is haunted by malevolent spirits.",
	"I hear the military are helping survivors with air drops. Your loot is always welcome here if you find one.",
	"Dogs can help you find pelts and animal carcasses",
	"I heard that a new vehicle has been seen, some kind of board that you stand on. I personally don't believe it."
];

[selectRandom _newsArr, 5,[[0,0,0,0.5],[1,0.5,0,1]]] call Epoch_message;
