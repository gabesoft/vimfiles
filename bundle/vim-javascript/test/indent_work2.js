var match = flags.filter(function(f) {                                      // 
        return el.hasClass(f.color);                                        // 
    })                                                                      // 
  , flag  = match.length === 1                                              // 
        ? match[0]                                                          // 
        : flags[0];                                                         // 

el.removeClass(flag.color);                                                 // 

this._compare = isFunc(compare) 
    ? compare                                                               // 
    : function(a, b) {                                                      // 
        if (a === b) { return 0; }                                          // 
        return a < b ? -1 : 1;                                              // 
    };                                                                      // 

this._gt = function(a, b) {                                                 // 
    return self._compare(a, b) === -1;                                      // 
};                                                                          // 
this._lt = function(a, b) {                                                 // 
    return self._compare(a, b) ===  1;                                      // 
};                                                                          // 

this._compare = isFunc(compare)                                             // 
    ? compare                                                               // 
    : 'other';                                                              // 

this._len = 9;                                                              // 

modules.export = function() {                                               // 
    var auth  = require('./auth.js')(app.modules.redis)                     // 
      , util  = require('../util.js')                                       // 
      , users = app.modules.users                                           // 
      , render = function(req, res) {                                       // 
            req.render();                                                   // 
        };                                                                  // 

    /*                                                                      // 
     * page1                                                                // 
     */                                                                     // 
    app.get('/localhost/page1', render);                                    // 

    /*                                                                      // 
     * page 2                                                               // 
     */                                                                     // 
    app.get('/localhost/page2', render);                                    // 
};

var text  = [                                                               // 
        new Text('The output of all processes has been turned ' )           // 
      , new Text('on', 'green') ]                                           // 
  , lines = this.makeLines(text, 2);                                        // 

Proc.prototype.toJSON = function() {                                        // 
    return {                                                                // 
        name: this.name                                                     // 
      , color: this.color                                                   // 
      , command: this.command                                               // 
      , args: this.args                                                     // 
      , cwd: this.cwd || ''                                                 // 
        //, env: this.env   // TODO: fix this                               // 
      , pid: util.nil(this.proc) ? 0 : this.proc.pid                        // 
      , argv: this.argv                                                     // 
    };                                                                      // 
};                                                                          // 

// TODO: this case still needs to be fixed
//var partial = 
//a === 8 ||
//b === 9 ||
//c === 7
//, k = 9;

var cont = 1 +                                                              // 
        2 +                                                                 // 
        3                                                                   // 
  , othr = 3 + 'abc';                                                       // 

var partial = a === 8 ||                                                    // 
        b === 9 ||                                                          // 
        c === 7                                                             // 
  , partial2 = a === 9 &&                                                   // 
        b === 8 &&                                                          // 
        c === 0                                                             // 
  , other = 'n';                                                            // 

var match = flags.filter(function(f) {                                      // 
        return el.hasClass(f.color);                                        // 
    })                                                                      // 
  , flag  = match.length === 1                                              // 
        ? match[0]                                                          // 
        : flags[0];                                                         // 

el.removeClass(flag.color);                                                 // 

var a = 3                                                                   // 
  , disableRelativeUrls = function(doc) {                                   // 
        //doc.find('img').each(function() {                                 // 
        doc.find('a').each(function() {                                     // 
            var link = $(this)                                              // 
              , href = link.attr('href')                                    // 
              , uri = relative(href) ? '' : href;                           // 
            link.attr('href', uri);                                         // 
        });                                                                 // 
    };                                                                      // 

var stuff = {                                                               //
        title: util.str.sprintf('%s (%s)', doc.find('#title').html(), file) //
      , input: util.str                                                     //
           .trim(doc.find('#input').html())                                 //
           .replace(/\n/g, '')                                              //
           .replace(/\s+/, ' ')                                             //
      , expected: util.str                                                  //
           .trim(doc.find('#expected').html())                              //
           .replace(/\n/g, '')                                              //
           .replace(/\s+/, ' ')                                             //
      , another: util.str                                                   //
           .trim(doc)                                                       //
           .filter(function(d) {                                            //
                return true;                                                //
            })                                                              //
      , lastOne: 9                                                          //
    };                                                                      //

var x = {                                                                   //
        field1: 'test'                                                      //
      , success: function(list, resp) {                                     //
            // comment here                                                 //
            me.model.each(me.append);                                       //
            me.start += me.limit;                                           //
            me.loading = false;                                             //
        }                                                                   //
    };                                                                      //

var user      = req.session.user                                            //
  , userFeeds = req.session.user.feeds                                      //
  , settings  = new Settings(app.modules.redis, user.id)                    //
    //, settings  = req.session.user.settings                               //
  , func = function(a) {                                                    // 
        // comment                                                          // 
        return a;                                                           // 
    }                                                                       // 
    // another comment                                                      // 
  , start = parseInt(req.query.start || '0', 10)                            //
  , limit = parseInt(req.query.limit || '200', 10);                         //

var user      = req.session.user                                            //
   ,userFeeds = req.session.user.feeds                                      //
   ,settings  = new Settings(app.modules.redis, user.id)                    //
    //, settings  = req.session.user.settings                               //
   ,start     = parseInt(req.query.start || '0', 10)                        //
   ,limit     = parseInt(req.query.limit || '200', 10);                     //

var user      = req.session.user,                                           //
    userFeeds = req.session.user.feeds,                                     //
    settings  = new Settings(app.modules.redis, user.id),                   //
    //, settings  = req.session.user.settings                               //
    start     = parseInt(req.query.start || '0', 10),                       //
    limit     = parseInt(req.query.limit || '200', 10);                     //

var b = 8;
if (e.target.nodeName === 'A' &&                                            //
    e.target.classList.contains('iconic')) {                                //
    return;                                                                 //
} else if (e.target.nodeName === 'SPAN' &&                                  //
    e.target.classList.contains('flag')) {                                  //
    this.updateFlag(e);                                                     //
} else {                                                                    //
    this.toggleDescription(e);                                              //
}                                                                           //


var iterator = _und.isFunction(val)                                         //
        ? val                                                               //
        : function(obj) {                                                   //
            // comment
            return obj[val];                                                //
        };                                                                  //

spect(util                                                                  //
    .chain(res)                                                             //
    .pluck('date')                                                          //
    // why doesn't the result have real dates                               //
    .map(function(d) {                                                      //
         return new Date(d);                                                //
     })                                                                     //
    .zip(util.pluck(sorted, 'date'))                                        //
    .value());                                                              //

var count   = contentIds.length,                                            //
    text    = "{0} content item{1} moved from {2} to {3}",                  //
    message = Ext.String.format(text,                                       //
        (count === 1 ? "One" : count),                                      //
        (count === 1 ? ' was' : 's were'),                                  //
        sourceFolder.get('text'),                                           //
        targetFolder.get('text'));                                          //

grid.remove(contentIds);                                                    //

thisIsAVeryLongVariableName = 'expressionPartOne' + someMethodThatIsLong() +
    thisIsAnEvenLongerOtherFunctionNameThatCannotBeIndentedMore();

someValue = this.foo(                                                       //
    shortArg,                                                               //
    'Some really long string arg - this is a pretty common case,actually.',
    shorty2,                                                                //
    this.bar());                                                            //

window.x = a +                                                              //
    "b" +                                                                   //
    c -                                                                     //
    d;                                                                      //

module.exports.bar = a +                                                    //
    b -                                                                     //
    c *                                                                     //
    d /                                                                     //
    9;                                                                      //

module.exports.foo = (b === c)                                              //
    ? 'yes'                                                                 //
    : 'no';                                                                 //

var fn = function (a, b, c) {                                               //
        var k = a === 5 ?                                                   //
            b :                                                             //
            c,                                                              //
            m = a + b,                                                      //
            n = c + k;                                                      //
        return a + b - m;                                                   //
    };                                                                      //

if (a ||                                                                    //
    b &&                                                                    //
    c) {                                                                    //
    module.exports.bar = a +                                                //
        b -                                                                 //
        c *                                                                 //
        d /                                                                 //
        9;                                                                  //
}                                                                           //

var exp1 = a +                                                              //
        b -                                                                 //
        c /                                                                 //
        d *                                                                 //
        k1 -                                                                //
        123,                                                                //
    exp2 = exp1 % 5 === 0                                                   //
        ? "five"                                                            //
        : "other",                                                          //
    exp3 = exp1 + exp2;                                                     //


var abcd = reallylongname +                                                 //
        anotherlongname,                                                    //
    b1 = a + cool,                                                          //
    c1 = 9;                                                                 //

var k = Object                                                              //
       .keys                                                                //
       .map(function (x) {                                                  //
            return x > 10                                                   //
                ? 'greater'                                                 //
                : 'lower';                                                  //
        })                                                                  //
  , w = k                                                                   //
       .filter(function (x) {                                               //
            return x === 'greater';                                         //
        })                                                                  //
  , y = k                                                                   //
       .concat(w)                                                           //
       .take(10);                                                           //

var w = a                                                                   //
        ? simple                                                            //
        : complex                                                           //
  , y = (zzz === 1)                                                         //
        ? 1                                                                 //
        : 2                                                                 //
  , p = 'p';

var x = a ? b : c;  // All on one line if it will fit.                      //

// Indentation +4 is OK.
var y = a ?                                                                 //
    longButSimpleOperandB : longButSimpleOperandC;                          //

// Indenting to the line position of the first operand is also OK.          //
var z = a ?                                                                 //
    moreComplicatedB :                                                      //
    moreComplicatedC;                                                       //

var w = a                                                                   //
        ? simple                                                            //
        : complex                                                           //
  , y = (zzz === 1)                                                         //
        ? 1                                                                 //
        : 2                                                                 //
  , p = 'p';

var html = '<input type="checkbox"' +                                       //
        (isChecked ? ' checked' : '') +                                     //
        (isEnabled ? '' : ' disabled') +                                    //
        ' name="foo">';                                                     //


switch(p) {                                                                 // 3
    case 'case1': break;                                                    // 3
    case 'case2': break;                                                    // 3
    case 'case3': return {                                                  //
        a: 1,                                                               //
        b: 3                                                                //
    };                                                                      //
    default:                                                                // 3
}                                                                           // 3

switch(bar) {                                                               //
    case 'a':                                                               //
        if (x)                                                              //
            return 'c';                                                     //
        else                                                                //
            return 'k';                                                     //
        break;                                                              //
    case 'b':                                                               //
        if (bar) {                                                          //
            return 'c';                                                     //
        } else {                                                            //
            var k = 9,                                                      //
                j = 10;                                                     //
            return list                                                     //
               .take(k)                                                     //
               .skip(j)                                                     //
               .filter(function (x) {                                       //
                    return x > k;                                           //
                });                                                         //
        }                                                                   //
        break;                                                              //

    default:                                                                //
        throw new Exception('switch');                                      //
}                                                                           //

switch (foo) {                                                              //
    case a: break;                                                          //

    // c for cigar                                                          //
    // b for bravo                                                          //
    case b:                                                                 //
        break;                                                              //

    // d for dope
    case d:                                                                 //
        switch (bar) {                                                      //
            case e:                                                         //
                break;                                                      //

            default:                                                        //
                break;                                                      //
        }                                                                   //
        break;

    // coment                                                               //
    default:                                                                //
        break;                                                              //
}                                                                           //
switch (condition) {                                                        //
    case 1:                                                                 //
        action1();                                                          //
        break;                                                              //
    //
    case 2:                                                                 //
        action2();                                                          //
        break;                                                              //
    //
    case 3:                                                                 //
        return list                                                         //
           .map(toStr)                                                      //
           .skip(2);                                                        //
    default:                                                                //
        defaultAction();                                                    //
}                                                                           //


// = Case: switch
switch(x) {                                                                 // 
    case "y":                                                               // 
        y;                                                                  // 
        break;                                                              // 

    case "z":                                                               // 
        z;                                                                  // 
        break;                                                              // 

    default:                                                                // 
        w;                                                                  // 
        break;                                                              // 
}
