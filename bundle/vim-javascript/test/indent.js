//
// Sample Javascript test code
//
//


// = Case: Arithmetic (1)
var x = 1 + 1;                                                              //

// = Case: Arithmetic (2)
var x = 1 +                                                                 //
        1;                                                                  //

// = Case: Arithmetic (3)
var x = 1 +                                                                 //
        1 +                                                                 //
        1;                                                                  //

// = Case: Object (2)
var x = { y : y, z : z },                                                   //
    w;                                                                      //

// = Case: Object (1)
var x = {                                                                   //
        // comment                                                          //
        y : y,  // 1
        z : z                                                               //
    };                                                                      //

// = Case: Object (2)
var x = {                                                                   //
        // comment                                                          //
        y : {                                                               //
            z: z, // 2
            w: w  // 2
        },                                                                  //
        t: t                                                                //
    };                                                                      //

/*
 * this is a comment
 */

var arr = [];                                                               //
arr = _                                                                     //
   .range(0, 100)                                                           //
   .concat([1])                                                             //
   .concat(Object.keys({}).map(function(key) {                              //
        return key;                                                         //
    }))                                                                     //
   .concat([1].map(function(x) {                                            //
        return x + 1;                                                       //
    }))                                                                     //
   .concat(Object                                                           //
       .keys({                                                              //
            a: 1,                                                           //
            b: 2,                                                           //
            c: 3                                                            //
        })                                                                  //
       .filter(function (x) { return x % 2 === 0; })                        //
       .take(2))                                                            //
   .take(function(x) {                                                      //
        var a = arr,                                                        //
            b = a.length,                                                   //
            c = a + b;                                                      //
        return c;                                                           //
    });                                                                     //

var o1 = {                                                                  //
        field1: [ "one",                                                    //
            "two",                                                          //
            "three",                                                        //
            "four" ],                                                       //
        field2: {                                                           //
            inner: [ "japan",                                               //
                "china",                                                    //
                "us"                                                        //
            ]                                                               //
        }                                                                   //
    };                                                                      //

var o2 = { f1: 1,                                                           //
        f2: 3,                                                              //
        f3: 'a'                                                             //
    };                                                                      //

var obj = {                                                                 //
        works: function() {                                                 //
            _.bindAll(this                                                  //
              , 'subscribeOnEnter'                                          //
              , 'subscribe'                                                 //
              , 'render'                                                    //
              , 'append'                                                    //
            );                                                              //
        },                                                                  //
        notquite: function() {                                              //
            _.bindAll(this                                                  //
              , 'subscribeOnEnter'                                          //
              , 'subscribe'                                                 //
              , 'render'                                                    //
              , 'append');                                                  //
        }                                                                   //
    };                                                                      //

var a = 1,                                                                  //
    b = 'test',                                                             //
    c = 'hello',                                                            //
    d = new Date(),                                                         //
    f = function(x) { console.log(x); },                                    //
    h = function(y, z) {                                                    //
        console.log(y, z);                                                  //
    };                                                                      //

var a = 1,                                                                  //
    b = 3,                                                                  //
    c = a + b,                                                              //
    e = 'f',                                                                //
    d = e;                                                                  //

var a = 1                                                                   //
  , b = a + 3                                                               //
  , c = b - 1 + a;                                                          //

var a = 1                                                                   //
  , b = 'test'                                                              //
  , c = 'hello'                                                             //
  , d = new Date()                                                          //
  , f = function(x) { console.log(x); }                                     //
  , h = function(y, z) {                                                    //
        console.log(y, z);                                                  //
    };                                                                      //

var e = function(z) {                                                       //
        var y = z;                                                          //
    };                                                                      //

$('.myclass', function(test) {                                              //
    var f = function() { console.log('hello'); };                           //
    $('a').on('hello', function(goodbye) {                                  //
        console.log(goodbye);                                               //
    });                                                                     //
});                                                                         //

var l = list                                                                //
       .map(function(x) { return x - 10; })                                 //
       .filter(function(x) { return x % 2 === 0; })                         //
       .take(10);                                                           //

list                                                                        //
   .map(function(x) { return x - 10; })                                     //
   .filter(function(x) { return x % 2 === 0; })                             //
   .take(10);                                                               //

var fun = function(x, y) {                                                  //
        return x + y;                                                       //
    };                                                                      //

function hola (arg) {                                                       //
    return 'yea';                                                           //
}                                                                           //

f3(f2(fun.add(function(x, y, z) {                                           //
    if (x === y) {                                                          //
        return x + y - z;                                                   //
    } else {                                                                //
        return x + y + z;                                                   //
    }                                                                       //
})));                                                                       //

f3(                                                                         //
    f2(                                                                     //
        fun.add(                                                            //
            function(x, y, z) {                                             //
                return x + y - z;                                           //
            }                                                               //
        )                                                                   //
    )                                                                       //
);                                                                          //

bright.mul(function(arg) {                                                  //
    console.log(arg);                                                       //
});                                                                         //

var f1 = function(x, y, z) {                                                //
        console.log(x,                                                      //
            y,                                                              //
            z,                                                              //
            w);                                                             //
    };                                                                      //

function hello (arg) {                                                      //
    var foo = function(arg2) {                                              //
            var bar = function(arg3) {                                      //
                    return arg + arg2 + arg3;                               //
                };                                                          //
        };                                                                  //
}                                                                           //

var a = 0                                                                   //
  , b = function(x) {                                                       //
        console.log(x);                                                     //
    }                                                                       //
  , c = function(y, z) {                                                    //
        console.log(a, y, z);                                               //
        var fn = function(w) {                                              //
                console.log(a + x + w);                                     //
            };                                                              //
        var c = '1'                                                         //
          , b = 9                                                           //
          , d = function() {                                                //
                return x + y - w;                                           //
            };                                                              //
    };                                                                      //

// Case: Function (1)
function $blah() {                                                          //
    var a = x + 1;                                                          //
    var b = y;                                                              //
}                                                                           //

// Case: Function (2)
var $blah = function() {                                                    //
        var a = x + 1;                                                      //
        var b = y;                                                          //
    };                                                                      //

// Case: Function(3)
var x = {                                                                   //
        $blah: function() {                                                 //
            var k = y;                                                      //
        }                                                                   //
    };                                                                      //

// Case: Function(4)
function $blah(                                                             //
    x,                                                                      //
    y,                                                                      //
    z ) {                                                                   //
}                                                                           //

// Case: Function (5)
function $blah(                                                             //
    x,                                                                      //
    y,                                                                      //
    z ) {                                                                   //
    var k;                                                                  //
}                                                                           //


// = Case: if (1)
if ( x ) {                                                                  //
    var a = x;                                                              //
}                                                                           //

// = Case: if (2)
if(x) {  // 0
    console.log(x);                                                         //
} else {
    console.log(y);                                                         //
}

// = Case: if (3)
if(x)                                                                       //
{                                                                           //
    console.log(x);                                                         //
}                                                                           //

// = Case: if (4)
if( x === y &&                                                              //
    y === z ||                                                              //
    z === w) {                                                              //
    console.log(x);                                                         //
}                                                                           //

// = Case: if (4a)
if( x === y &&                                                              //
    y === z ||                                                              //
    z === w)                                                                //
{                                                                           //
    console.log(x);
}                                                                           //


// = Case: if (5)
if(x) {                                                                     //
    // comment                                                              //
    a(y);                                                                   //
    b(x);                                                                   //
}


// = Case: if else (1)
if ( x ) {                                                                  //
    a(x);                                                                   //
} else {                                                                    //
    b(y);                                                                   //
}                                                                           //

// = Case: if else (2)
if ( x ) {                                                                  //
    a(x);                                                                   //
}
else {                                                                      //
    b(y);                                                                   //
}

// = Case: if else(3)
if(x)                                                                       //
{                                                                           //
    a(x);                                                                   //
}                                                                           //
else                                                                        //
{                                                                           //
    b(y);                                                                   //
}                                                                           //

// = Case: if elseif else ()                                                //
if ( x ) {                                                                  //
    a(x);                                                                   //
} else if ( y ) {                                                           //
    a(y);                                                                   //
} else {                                                                    //
    a(z);                                                                   //
}                                                                           //

// = Case: if elseif else ()                                                //
if ( x ) {                                                                  //
    a(x);                                                                   //
}
else if ( y ) {                                                             //
    a(y);                                                                   //
}
else {                                                                      //
    a(z);                                                                   //
}

// = Case: if elseif else (3)
if(x)                                                                       //
{                                                                           //
    a(x);                                                                   //
}                                                                           //
else if(y)                                                                  //
{                                                                           //
    a(y);                                                                   //
}                                                                           //
else                                                                        //
{                                                                           //
    a(z);                                                                   //
}                                                                           //

// = Case: for (1)
for (var i = 0; i < blah.length; i++) {                                     //
    blah[i];                                                                //
};                                                                          //

// = Case: for (2)
for (var i = 0; i < blah.length; i++)                                       //
    blah[i];                                                                //
x;                                                                          //

// = Case: try (1)
try {                                                                       //
    x;                                                                      //
}                                                                           //

// = Case: try (2)
try                                                                         //
    x;                                                                      //
y;                                                                          //

// = Case: try (3)
try                                                                         //
{                                                                           //
    x;                                                                      //
}                                                                           //

// = Case: try catch (1)
try {                                                                       //
    x;                                                                      //
} catch(e) {                                                                //
    y;                                                                      //
}                                                                           //

// Case: try catch (2)
try                                                                         //
{                                                                           //
    x;                                                                      //
}                                                                           //
catch(e)                                                                    //
{                                                                           //
    y;                                                                      //
}                                                                           //

// Case: try catch (3)
try                                                                         //
    x;                                                                      //
catch(e)                                                                    //
    y;                                                                      //


// Case: try catch finally (1)
try {                                                                       //
    x;                                                                      //
    y;                                                                      //
} catch(e) {                                                                //
    x;                                                                      //
    y;                                                                      //
} finally {                                                                 //
    x;                                                                      //
    y;                                                                      //
}

// = Case: try catch finally (2)
try                                                                         //
    x;                                                                      //
catch(e)                                                                    //
    y;                                                                      //
finally                                                                     //
    z;                                                                      //

// = Case: try catch finally (3)
try          {                                                              //
    // comment                                                              //
    x;                                                                      //
}
catch(e)   {                                                                //
    // comment                                                              //
    y;                                                                      //
}
finally {                                                                   //
    // comment                                                              //
    z;                                                                      //

    // = Case: AnonymousFunction (1)
    (function(x) {                                                          //
        x;                                                                  //
        y;                                                                  //
    })(x);                                                                  //

    // = Case: AnonymousFunction (2)
    (function(x)                                                            //
        {                                                                   //
            x;                                                              //
            y;                                                              //
        })(x);                                                              //

    // = Case: Anonymous Function (2)
    (function(x)                                                            //
        {                                                                   //
            x;                                                              //
            y;                                                              //
        }                                                                   //
    )(x);                                                                   //

    // = Case: Anonymous Function (1)
    (function(x) {                                                          //
        x;                                                                  //
        y;                                                                  //
    }                                                                       //
    )(x);                                                                   //

    // = Case: Multi Line Invocation (1)
    $(document).bind('click', function() {                                  //
    });                                                                     //

    // = Case: Multi Line Invocation (2)
    $(document).bind('click', function() {                                  //
        x;                                                                  //
        y;                                                                  //
    });                                                                     //
}

// = Case: COMPLEX
(function(window, undefined) {                                              //
    // = Class: Test                                                        //
    //                                                                      //
    // = Description: This is a                                             //
    //   test class.                                                        //
    //                                                                      //
    var Test = new Class({                                                  //
            initialize: function() {                                        //
                this.test = test;                                           //
            },                                                              //

            // = Method: test                                               //
            //                                                              //
            // = Description:                                               //
            //                                                              //

            //if (true){} // this fails due to no space between ) and {
            if (true) {}                                                    // 
            if (true)                                                       // 
                var x = 9;                                                  // 

            test: function(blah) {                                          //
                if(blah) {                                                  //
                    return "blah";                                          //
                } else if(blah === undefined)                               //
                    return "blahblah";                                      //
                else {                                                      //
                    // another comment.                                     //
                    return "blahblahblah";                                  //
                }                                                           //

                var x = {                                                   //
                        y: function() {                                     //
                            for (var i = 0; i < blah.length; i++) {         //
                                blah[i];                                    //
                            };                                              //
                        }                                                   //
                    };                                                      //

                return new function() {                                     //
                };                                                          //
            },                                                              //

            // = Method: blah                                               //
            //                                                              //
            // = Description: description                                   //
            //                                                              //
            blah: function(haha) {                                          //
                return this.test;                                           //
            }                                                               //
        });                                                                 //
})(this);                                                                   //


// Case: SKELETON CODE
(function(window, undefined) {                                              //
    var Skeleton = new Class({                                              //
        });                                                                 //

    var Skeleton2 = new Class({                                             //
            Extends: Skeleton                                               //
        });                                                                 //

    var Skeleton3 = new Class({                                             //
            skeleton: function() {                                          //
            },                                                              //

            objects: function() {                                           //
                var x, y;                                                   //

                x = {};                                                     //
                y = [];                                                     //

                x = {                                                       //
                };                                                          //

                y =  [                                                      //
                ];                                                          //

            },                                                              //

            contrls: function() {                                           //
                while(true) {                                               //
                }                                                           //

                do {                                                        //
                } while(true);                                              //

                with(x) {                                                   //
                }                                                           //

                if (true) {                                                 //
                } else if(true) {                                           //
                } else {                                                    //
                }                                                           //

                for (var i = 0; i < blah.length; i++) {                     //
                }                                                           //

                switch(true) {                                              //
                    case 'case1': break;                                    //
                    case 'case2': break;                                    //
                    case 'case3': return {                                  //
                        a: 1,                                               //
                        b: 3                                                //
                    }                                                       //
                    default:                                                //
                }                                                           //

                try {                                                       //
                } catch (e) {                                               //
                } finally {                                                 //
                }                                                           //
            }                                                               //
        });                                                                 //
})(this);                                                                   //

/*
 * Comment Test
 * function() {
 *
 */
(a / b); // c
'' + "'" +; // ' (

window.x = a +
    "b" +
    c -
    d;
while (true) {                                                              //
    if (true) {                                                             //
        console.info((function() {                                          //
            return x;                                                       //
        }).something);                                                      //
        next();                                                             //
        var a = (function() {                                               //
                if (k) {                                                    //
                    return 1;                                               //
                } else {                                                    //
                    return 3;                                               //
                }                                                           //
            });                                                             //

        var b = 9,                                                          //
            c = (function(a) {                                              //
                return 99 + '';                                             //
            }),                                                             //
            e = new Widget({                                                //
                a: 'test',                                                  //
                b: 3,                                                       //
                cha: 'cha'                                                  //
            }),                                                             //
            d = '1';                                                        //
    }                                                                       //

    // TODO: what should the indentation be here?
    //foo (a(b,                                                             //
    //c)) {                                                                 //
    //aoeu;                                                                 //
    //}                                                                     //

    function a() {                                                          //
        test([                                                              //
            "hello",                                                        //
            "world",                                                        //
            "a",                                                            //
            "b"                                                             //
        ]);                                                                 //
        test([                                                              //
            "hello"                                                         //
          , "world"                                                         //
          , "a"                                                             //
          , "b"                                                             //
        ]);                                                                 //
    }                                                                       //

    a = "hello \
    world"

    /hello(world/
    a + /aoe(uaoeu/
    (a / b); // c ( /
    (a / b); // (
    /a\/b/ // c (
    world

    var rinput = /^(?:color|date|datetime|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,
        // #7653, #8125, #8152: local protocol detection
        rlocalProtocol = /(?:^file|^widget|\-extension):$/,
        /* comment 2 */
        assigment2;

    /* a [{( */
    // b [{(
    comment('/* com', a /* [{( */); /* c */ // d
    ok();
    // Assign Test
    var a, /* { */                                                          //
        b, // [                                                             //
        /reg/,                                                              //
        c = '{';                                                            //

    var a = "Hello" +
            (3+4) +
            "World";
    return a +                                                              //
        b +                                                                 //
        c;                                                                  //
    d = function() {                                                        //
        aoeu                                                                //
    }

    function a() {                                                          //
        test(["hello",                                                      //
            "world"                                                         //
        ])                                                                  //
    }                                                                       //
    var k = function() {                                                    //
            var k=3,                                                        //
                m=4                                                         //
        };                                                                  //

    var m = new SWFUpload({                                                 //
            debug: false                                                    //
        });                                                                 //

    //var rurl = /{[('"/,
    //r20 = /%20/g,

    //a = 1,
    //b = 2
    //a = 1 +
    //2 *
    //3

    // Function nested
    (function($) {                                                          //
        $(document).ready(function() {                                      //
            $('#foo').click(function() {                                    //
                $.post(url, {                                               //
                    a: 1,                                                   //
                    b: 2,                                                   //
                }, function() {                                             //
                    ok();                                                   //
                });                                                         //
            });                                                             //
        });                                                                 //
    })(jQuery);                                                             //
}

// Array Object Test
string_test("('",'("',"[",'{',"\"{","\\'{");                                //
{                                                                           //
    array_object_test: [                                                    //
        1,                                                                  //
        2,                                                                  //
        {                                                                   //
            a: [3,4],                                                       //
            b: [                                                            //
                3,                                                          //
                4                                                           //
            ],                                                              //
            c: string_test("('",'("',"[",'{',"\"{","\\'{"),                 //
            function_test: function() {                                     //
                return 0;                                                   //
            },                                                              //
            one_line_function_test: function() { return [1] }               //
        }                                                                   //
    ]                                                                       //
}                                                                           //

// One Line Test                                                            //
{                                                                           //
    if( a == b && // comment                                                //
        c == d ||                                                           //
        e == f)                                                             //
    {                                                                       //
        ok();                                                               //
    }                                                                       //
    if (a) {                                                                //
        b;                                                                  //
    } else {                                                                //
        e;                                                                  //
    }                                                                       //
    if (a)                                                                  //
        b;                                                                  //
    if (a)                                                                  //
        b;                                                                  //
    else if (k) {                                                           //
        aeou                                                                //
    } else                                                                  //
        c;                                                                  //
    while (true)                                                            //
        foo += 1;                                                           //
    try                                                                     //
        a;                                                                  //
    catch                                                                   //
        b;                                                                  //
    finally                                                                 //
        c;                                                                  //
    ok();                                                                   //
}

query = query.replace(/\=\s*([^'"\]]*)\s*\]/g, "='$1']");
// Only use querySelectorAll on non-XML documents
{
    for ( var type in Expr.match ) {
        Expr.match[ type ] = new RegExp( Expr.match[ type ].source + (/(?![^\[]*\])(?![^\(]*\))/.source) );
        Expr.leftMatch[ type ] = new RegExp( /(^(?:.|\r|\n)\/*?)/.source + Expr.match[ type ].source.replace(/\\(\d+)/g, fescape) );
    }
}
{
    add: function( handleObj ) {
        jQuery.event.add( this,
            liveConvert( handleObj.origType, handleObj.selector ),
            jQuery.extend({}, handleObj, {handler: liveHandler, guid: handleObj.handler.guid}) );
    },
    hello()
}

{
    if ( jQuery.isWindow( elem ) ) {
    } else if ( elem.nodeType === 9 ) {
        // Either scroll[Width/Height] or offset[Width/Height], whichever is greater
        return Math.max(
            elem.documentElement["client" + name],
            elem.body["scroll" + name], elem.documentElement["scroll" + name],
            elem.body["offset" + name], elem.documentElement["offset" + name]
        );

        // Get or set width or height on the element
    }

    function a() {                                                          //
        $('"', {'b'}, function() {                                          //
        });                                                                 //
    }                                                                       //

    test(//aoeuaou{                                                         //
        hello();                                                            //
    );                                                                      //
    test(/*a'*/,'ee') {                                                     //
        foo();                                                              //
    }                                                                       //
    function escapeattr(b) {                                                //
        return (/./i, "") : ""                                              //
    }                                                                       //

    switch (foo) {                                                          //
        case a: break;                                                      //

        case b:                                                             //
            break;                                                          //

        case d:                                                             //
            switch (bar) {                                                  //
                case e:                                                     //
                    break;                                                  //

                default:                                                    //
                    break;                                                  //
            }                                                               //
            break;

        default:                                                            //
            break;                                                          //
    }                                                                       //
}                                                                           //

var a = a                                                                   //
  , b = b                                                                   //
  , c = c;                                                                  //
//
var a = a                                                                   //
  , b = b                                                                   //
  ;                                                                         //
//
bar(function () {                                                           //
    foo({                                                                   //
        a : a                                                               //
      , b : b                                                               //
      , c : c                                                               //
      , d : {                                                               //
            e : e                                                           //
            f : f                                                           //
        }                                                                   //
      , g : {[                                                              //
            h : h                                                           //
          , i : i                                                           //
        ]}                                                                  //
    });                                                                     //
});

var testing = function (){                                                  //
        return {                                                            //
            showDialog:new Dialog([                                         //
                {                                                           //
                    1:'testing',                                            //
                    2:'coba',                                               //
                    3:'jajal'                                               //
                }                                                           //
            ])                                                              //
        };                                                                  //
    };

// Object initializer.
var inset = {                                                               //
        top: 10,                                                            //
        right: 20,                                                          //
        bottom: 15,                                                         //
        left: 12                                                            //
    };                                                                      //

// Array initializer.
this.rows_ = [                                                              //
    '"Slartibartfast" <fjordmaster@magrathea.com>',                         //
    '"Zaphod Beeblebrox" <theprez@universe.gov>',                           //
    '"Ford Prefect" <ford@theguide.com>',                                   //
    '"Arthur Dent" <has.no.tea@gmail.com>',                                 //
    '"Marvin the Paranoid Android" <marv@googlemail.com>',                  //
    'the.mice@magrathea.com'                                                //
];                                                                          //

// Used in a method call.
goog.dom.createDom(goog.dom.TagName.DIV, {                                  //
    id: 'foo',                                                              //
    className: 'some-css-class',                                            //
    style: 'display:none'                                                   //
}, 'Hello, world!');                                                        //

CORRECT_Object.prototype = {                                                //
    a: 0,                                                                   //
    b: 1,                                                                   //
    lengthyName: 2                                                          //
};                                                                          //

// Parenthesis-aligned, one argument per line.  Visually groups and         //
// emphasizes each individual argument.                                     //
function bar(veryDescriptiveArgumentNumberOne,                              //
    veryDescriptiveArgumentTwo,                                             //
    tableModelEventHandlerProxy,                                            //
    artichokeDescriptorAdapterIterator) {                                   //
    return 0;                                                               //
}                                                                           //

prefix.something.reallyLongFunctionName('whatever', function(a1, a2) {      //
    if (a1.equals(a2)) {                                                    //
        someOtherLongFunctionName(a1);                                      //
    } else {                                                                //
        andNowForSomethingCompletelyDifferent(a2.parrot);                   //
    }                                                                       //
});                                                                         //

var names = prefix.something.myExcellentMapFunction(                        //
        verboselyNamedCollectionOfItems,                                    //
        function(item) {                                                    //
            return item.name;                                               //
        });                                                                 //

//,
var names = prefix.something.myExcellentMapFunction(                        //
        verboselyNamedCollectionOfItems                                     //
      , function(item) {                                                    //
            return item.name;                                               //
        });                                                                 //

hereIsAnEvenLongerOtherFunctionNameThatWillNotFitOnPrevLine();              //

thisIsAVeryLongVariableName = 'expressionPartOne' + someMethodThatIsLong() +
    thisIsAnEvenLongerOtherFunctionNameThatCannotBeIndentedMore();

someValue = this.foo(                                                       //
    shortArg,                                                               //
    'Some really long string arg - this is a pretty common case,actually.',
    shorty2,                                                                //
    this.bar());                                                            //

if (searchableCollection(allYourStuff).contains(theStuffYouWant) &&
    !ambientNotification.isActive() && (client.isAmbientSupported() ||
        client.alwaysTryAmbientAnyways())) {
    ambientNotification.activate();
}

var x = a ? b : c;  // All on one line if it will fit.                      //

// Indentation +4 is OK.
var y = a ?                                                                 //
    longButSimpleOperandB : longButSimpleOperandC;                          //

// Indenting to the line position of the first operand is also OK.          //
var z = a ?                                                                 //
    moreComplicatedB :                                                      //
    moreComplicatedC;                                                       //

var html = '<input type="checkbox"' +                                       //
        (isChecked ? ' checked' : '') +                                     //
        (isEnabled ? '' : ' disabled') +                                    //
        ' name="foo">';                                                     //


if (node) {                                                                 //
    if (node.kids) {                                                        //
        if (node.kids[index]) {                                             //
            foo(node.kids[index]);                                          //
        }                                                                   //
    }                                                                       //
}                                                                           //

function listHtml(items) {                                                  //
    var html = [];                                                          //
    for (var i = 0; i < items.length; ++i) {                                //
        html[i] = itemHtml(items[i]);                                       //
    }                                                                       //
    return '<div class="foo">' + html.join(', ') + '</div>';                //
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


/**                                                                         //
 * YAHOO.CRUSH.Toons alerts the name of a Toon character                    //
 * @author Firstname Lastname <example@example.com>                         //
 * @namespace YAHOO.CRUSH                                                   //
 * @class Toons                                                             //
 */                                                                         //
YAHOO.CRUSH.Toons = function () {                                           //
    var toons; // holds ID, firstname and lastname                          //
    //
    toons = {                                                               //
        101: ["Mickey", "Mouse"],                                           //
        102: ["Donald", "Duck"],                                            //
        103: ["Bugs", "Bunny"],                                             //
        104: ["Daffy", "Duck"]                                              //
    };                                                                      //
    //
    /**                                                                     //
     * Returns full name of Toon character                                  //
     * @method getFullNameById                                              //
     * @param {Integer} id UserID of the Toon                               //
     * @return {String} fullname of the Toon                                //
     */                                                                     //
    var getFullNameById = function (id) {                                   //
            var fullName = toons[id][0] + " " + toons[id][1];               //
            return fullName;                                                //
        };                                                                  //
    //
    return {                                                                //
        /**                                                                 //
         * Alerts name of Toon                                              //
         * @method init                                                     //
         * @param {Integer} id UserID of the Toon                           //
         */                                                                 //
        init: function (id) {                                               //
            var user = getFullNameById(id);                                 //
            alert(user);                                                    //
        }                                                                   //
    };                                                                      //
}();                                                                        //

setInterval(updateResults, 1000);                                           //
setTimeout(function () {                                                    //
    x += 3;                                                                 //
    prepareResult();                                                        //
    if( !hasCancelled ) {                                                   //
        runmore();                                                          //
    }                                                                       //
}, 500);                                                                    //


app.path = function(){                                                      //
    return this.parent                                                      //
        ? this.parent.path() + this.route                                   //
        : '';                                                               //
};


exports.parseAccept = function(str){                                        //
    return exports                                                          //
       .parseQuality(str)                                                   //
       .map(function(obj){                                                  //
            var parts = obj.value.split('/');                               //
            obj.type = parts[0];                                            //
            obj.subtype = parts[1];                                         //
            return obj;                                                     //
        });                                                                 //
};                                                                          //

exports.parseQuality = function(str){                                       //
    return str                                                              //
       .split(/ *, */)                                                      //
       .map(quality)                                                        //
       .filter(function(obj){                                               //
            return obj.quality;                                             //
        })                                                                  //
       .sort(function(a, b){                                                //
            return b.quality - a.quality;                                   //
        });                                                                 //
};                                                                          //

var c12 = {                                                                 //
        initComponent: function () {                                        //
            var me = this                                                   //
              , fn = function (cmp) {                                       //
                    me.mask();                                              //
                }                                                           //
              , store = Ext.create('ce.data.treestore', {                   //
                    storeId: 'folder-store',                                //
                    listeners: {                                            //
                        beforeload: function () {                           //
                            if (me.getEl()) {                               //
                                fn(me);                                     //
                            } else {                                        //
                                me.on('render', fn, null, {                 //
                                    single: true,                           //
                                    delay: 1                                //
                                });                                         //
                            }                                               //
                        },                                                  //
                        load: function () {                                 //
                            me.un('render', fn);                            //
                            me.unmask();                                    //
                        }                                                   //
                    }                                                       //
                })                                                          //
              , view;                                                       //
            me.addEvents('exception', 'moveContentCompleted');              //
            me.relayEvents(store, ['exception', 'moveContentCompleted']);   //
            //
            Ext.apply(me, {                                                 //
                plugins: [{                                                 //
                    ptype: 'ce.plugin.cellediting',                         //
                    clicksToEdit: 2                                         //
                }],                                                         //
                columns: [{                                                 //
                    xtype: 'treecolumn',                                    //
                    flex: 1,                                                //
                    dataIndex: 'text',                                      //
                    editor: {                                               //
                        xtype: 'textfield',                                 //
                        selectOnFocus: true,                                //
                        ref: 'tree-editor',                                 //
                        allowBlank: false                                   //
                    },                                                      //
                    renderer: function (value, appearance, record) {        //
                        return me.styleContent(value, appearance, record);  //
                    }                                                       //
                }],                                                         //
                store: me.store || store,                                   //
                viewConfig: {                                               //
                    xtype: 'cetreeview',                                    //
                    plugins: {                                              //
                        ptype: 'ce.treeviewdragdrop',                       //
                        enableDrag: true,                                   //
                        ddGroup: 'contentDD',                               //
                        nodeHighlightOnDrop: true,                          //
                        nodeHighlightOnRepair: true,                        //
                        appendOnly: true                                    //
                    },                                                      //
                    style: {                                                //
                        overflow: 'auto',                                   //
                        overflowX: 'hidden'                                 //
                    }                                                       //
                },                                                          //
                dockedItems: [{                                             //
                    xtype: 'toolbar',                                       //
                    margin: 6,                                              //
                    height: 25,                                             //
                    padding: '0 0 0 28',                                    //
                    defaults: {                                             //
                        tooltipType: 'title'                                //
                    },                                                      //
                    items: [{                                               //
                        tooltip: RESOURCES.newFolderTooltip,                //
                        text: RESOURCES.newFolderButton,                    //
                        ref: 'newFolderButton',                             //
                        disabled: !SESSION.isAdmin,                         //
                        tooltipType: 'title',                               //
                        ui: 'main-btn',                                     //
                        iconCls: 'plus'                                     //
                    }, {                                                    //
                        xtype: 'tbspacer',                                  //
                        width: 15                                           //
                    }, {                                                    //
                        tooltip: RESOURCES.expandAllTooltip,                //
                        text: RESOURCES.expandAllButton,                    //
                        ref: 'expandButton',                                //
                        disabled: true,                                     //
                        ui: 'main-btn',                                     //
                        cls: 'ce-left-paddle'                               //
                    }, {                                                    //
                        tooltip: RESOURCES.collapseAllTooltip,              //
                        text: RESOURCES.collapseAllButton,                  //
                        ref: 'collapseButton',                              //
                        disabled: true,                                     //
                        ui: 'main-btn',                                     //
                        cls: 'ce-right-paddle'                              //
                    }]                                                      //
                }]                                                          //
            });                                                             //
            me.callParent();                                                //
            view = me.getView();                                            //
            view.getHeaderCt().markDirty = false;                           //
            // Fires when the delete-folder icon is clicked                 //
            me.relayEvents(view, ['nodedelete']);                           //
        }                                                                   //
    };                                                                      //
