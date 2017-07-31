<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="https://hammerjs.github.io/dist/hammer.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=no">
<title></title>
<style>
#areaPadd {
	background: blue;
	height: 300px;
	text-align: center;
}

#myElement {
	background: silver;
	height: 300px;
	text-align: center;
	font: 30px/300px Helvetica, Arial, sans-serif;
}

#hitarea {
	background: white;
	height: 50px;
	width: 50px;
}

#tapD {
	background: white;
	height: 300px;
	text-align: center;
}
</style>

</head>
<body>
	<div id="myElement"></div>
	<div id="tabD"></div>
	<div id="areaPadd">
		<div id="hitarea"
			style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); transform: translate3d(235px, 100px, 0px) scale(1, 1) rotate3d(0, 0, 0, 0deg);"></div>
	</div>

	<div id="text"></div>
	<script>
		var myElement = $('#myElement');

		//create a simple instance
		//by default, it only adds horizontal recognizers
		var mc = new Hammer(myElement);

		//listen to events...
		mc.on("panleft panright tap press", function(ev) {
			myElement.textContent = ev.type + " gesture detected.";
		});

		////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////

		var tapD = $('#tapD');
		var mcm = new Hammer.Manager(tapD);

		mcm.add(new Hammer.Tap({
			event : 'doubletap',
			taps : 2
		}));
		mcm.add(new Hammer.Tap({
			event : 'singletap'
		}));

		mcm.get('doubletap').recognizeWith('singletap');
		mcm.get('singletap').requireFailure('doubletap');

		mcm.on("singletap doubletap", function(ev) {
			tapD.textContent += ev.type + " ";
		});
	</script>

</body>
</html>
