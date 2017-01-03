var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var path = require('path');
var spawnSync = require('child_process').spawnSync;
var fs = require('fs');

var app = express();

app.use(express.static(path.join(__dirname + '/build/')));
app.use(express.static(path.join(__dirname + '')));
app.use(bodyParser.text());

router.post('/compile', (req, res, next) => {
    fs.writeFileSync('temp.c', req.body, {encoding: 'utf8'});
    var compiler = spawnSync('clang', [ '-c', '-S' , '-emit-llvm', 'temp.c' ]);
    if (compiler.status === 0) {
        var output = fs.readFileSync('temp.ll', { encoding: 'utf8'});
        res.json({ status: 'OK', output: output});
    } else {
        res.json({ status: 'OK', output: compiler.output[2].toString('utf8')})
    }
});

app.use('/compiler', router);

app.get('/', function(req, res, next) {
    res.sendFile('index.html')
});

app.listen(3000, function() {
    console.log("listening on localhost:3000");
});
