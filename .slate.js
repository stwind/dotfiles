var screen = S.screen();
var rect = screen.visibleRect();
var screenSizeX = rect.width;
var screenSizeY = rect.height;

S.cfga({
  defaultToCurrentScreen: true,
  nudgePercentOf: "screenSize",
  resizePercentOf: "screenSize",
  secondsBetweenRepeat: "0.1",
  checkDefaultsOnLoad: true,
  focusCheckWidthMax: 3000
});

S.bnd("right:ctrl", S.opstr("resize +10% +0"));
S.bnd("left:ctrl", S.opstr("resize -10% +0"));
S.bnd("up:ctrl", S.op("resize", {width : "0", height : (-screenSizeY/10).toString()}));
S.bnd("down:ctrl", S.op("resize", {width : "0", height : "+"+(screenSizeY/10).toString()}));

S.bnd("left:alt", S.opstr("resize +10% +0 bottom-right"));
S.bnd("right:alt", S.opstr("resize -10% +0 bottom-right"));
S.bnd("down:alt", S.op("resize", {width : "0", height : (-screenSizeY/10).toString(), anchor: "bottom-right"}));
S.bnd("up:alt", S.op("resize", {width : "0", height : "+"+(screenSizeY/10).toString(), anchor: "bottom-right"}));

S.bnd("right:ctrl;shift", S.op("push", {direction : "right", style: "bar-resize:screenSizeX/2"}));
S.bnd("left:ctrl;shift", S.op("push", {direction : "left", style: "bar-resize:screenSizeX/2"}));
S.bnd("up:ctrl;shift", S.op("push", {direction : "up", style: "bar-resize:screenSizeY/2"}));
S.bnd("down:ctrl;shift", S.op("push", {direction : "down", style: "bar-resize:screenSizeY/2"}));

S.bnd("1:ctrl;cmd", S.op("corner", {direction: "top-left", width: (screenSizeX/2).toString(), height: (screenSizeY/2).toString()}));
S.bnd("2:ctrl;cmd", S.op("corner", {direction: "bottom-left", width: (screenSizeX/2).toString(), height: (screenSizeY/2).toString()}));
S.bnd("3:ctrl;cmd", S.op("corner", {direction: "top-right", width: (screenSizeX/2).toString(), height: (screenSizeY/2).toString()}));
S.bnd("4:ctrl;cmd", S.op("corner", {direction: "bottom-right", width: (screenSizeX/2).toString(), height: (screenSizeY/2).toString()}));

S.bnd("right:ctrl;alt", S.op("nudge", {x : "+10%", y: "+0"}));
S.bnd("left:ctrl;alt", S.op("nudge", {x : "-10%", y: "+0"}));
S.bnd("up:ctrl;alt", S.op("nudge", {x : "+0", y: "-10%"}));
S.bnd("down:ctrl;alt", S.op("nudge", {x : "+0", y: "+10%"}));

S.bnd("1:ctrl;alt", S.opstr("throw 0 resize"));
S.bnd("2:ctrl;alt", S.opstr("throw 1 resize"));

S.bnd("esc:cmd", S.op("hint"));
