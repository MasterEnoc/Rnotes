let {readdir} = require('fs');
let {parse} = require('path');
var express = require('express');

var app = express();

app.set('views', './app/views/');
app.set('view engine', 'pug');

app.use(express.static('public', {index: false}));

app.get('/', (req, res)=> {
    readdir('./app/releaseNotes', (err, files)=>{

        let notes = files.map(file => parse(file).name);

        res.render('index', {notes:notes}, (err, html)=>{
            res.send(html);
        });
    });
});

app.all('*', (req, res, next)=>{
    next(res);
});

app.use((err, req, res, next)=>{
    res.status(500);
    res.render('404', {page:req._parsedOriginalUrl.pathname}, (err, html)=>{
        res.send(html);
    });
});

app.listen(8888, ()=>{
    console.log('Server started on port: 8888');
});
