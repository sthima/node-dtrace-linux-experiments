var d = require('dtrace-provider');

var dtp = d.createDTraceProvider("nodeapp");
var p1 = dtp.addProbe("probe1", "int", "int");
var p2 = dtp.addProbe("probe2", "char *");
dtp.enable();

function lorem() {
  console.log("lored");
  p1.fire(function() {
    console.log("Fired");
    return [1, 2];
  });
  setTimeout(lorem, 750);
}

setTimeout(lorem, 750);
