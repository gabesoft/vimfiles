//
/*                                                                          //
 * @e - add end comment                                                     //
 * @d - refresh indent script                                               //
 * this is a                                                                //

 * multi line comment                                                       //
 */                                                                         //

// = Case: Object (1)
var x = {                                                                   //
        // comment                                                          //
        y : y,                                                              //
        z : z                                                               //
    };

/*                                                                          // 
 * util.cont(arr, endfn, function(item, count) {                            // 
 *                                                                          // 
 * });                                                                      // 
 */                                                                         // 
var fn2 = function(x, y) {                                                  // 
        console.log('works');                                               // 
    };                                                                      // 

// Case: Function(4)
function $blah(                                                             //
    x,                                                                      //
    y,                                                                      //
    z ) {                                                                   //
    /* return nada */
}                                                                           //

/*
 * Iterates through an array asynchronously passing a continuation on each element.
 * - endfn will be called when there are no more elements in the array
 * - example call                                                           // 
 *   util.cont(arr, endfn, function(item, cont) {                           // 
 *     // do something with item                                            // 
 *     cont();                                                              // 
 *   });                                                                    // 
 */                                                                         // 
module.exports.cont = function(arr, end, fn) {                              // 
    cont(arr, 0, end, fn);                                                  // 
};                                                                          // 

/*
 * Comment Test                                                             //
 * function() {                                                             //
 *      return x;                                                           //
 * });
 */
var e1 = (a / b); // c                                                      //
var e2 = '' + "'" + ''; // ' (                                              //

var f = function () {
        k = (a / b); // c                                                   //
        m = '' + "'" + 8;// ' (                                             //
        n = "" + '"' + 9;// " (                                             //

        s = (a / b) + foo(c / d,                                            //
            9);                                                             //

        query = query.replace(/\=\s*([^'"\]]*)\s*\]/g, "='$1']");           //

        var e2 = '' + "'" + ''; // ' (                                      //

        f2 = foo('bar)',
            query,
            k);

        var s2 = "function((" + "  x / y)" + "({ z, w well it's right" + bar(s1);
        var s4 = "function((" + "  x / y)" + "({ z, w well it\"s right" + bar(s1);
        var s3 = 'function((' + '  x / y)' + '({ z, w well it\'s right' + bar(s1);
        var r2 = /function((/ + / x\/y)/ + /({z, w/i.test(s2);              //
        /* a [{( */                                                         //
        // b [{(                                                            //
        comment('/* com', a /* [{( */); /* c */ // d                        //
        str(/* this could ' be a */ ' string */ maybe', /*or a comment ', */ 'peraps // ' , a); /* 'or else  */ // ?'
        str(/* { */ ' /* in full color */', 'hello */', /* dogg ' */ ' it\'s funny', b);
        str(/* this could ' be a */ ' string */ maybe', /*or a comment ', */ 'peraps // '
          , a); /* 'or else  */ // ?'
        str(/* { */ ' /* in full color */', 'hello */', /* dogg ' */ ' it\'s funny',
            b);
    };

var make = function() {
        var rinput = /^(?:color|date|datetime|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,
            // #7653, #8125, #8152: local protocol detection
            rlocalProtocol = /(?:^file|^widget|\-extension):$/,
            /* comment 2 */
            assigment2;
        ok();                                                               //
        // Assign Test                                                      //
        var a; /* { */                                                      //
    };

function listHtml(items) {                                                  //
    /*                                                                      //
     more line                                                              //
     comments({                                                             //
     */                                                                     //

    if (true) {                                                             //
        var xw1 = 9,                                                        //
            xw3 = 'b';                                                      //
    }                                                                       //

    var xy1 = 9,                                                            //
        xy2 = function() {                                                  //
            var c = 9,                                                      //
                d = 10,                                                     //
                e = function() { return 'a'; },                             //
                g = function(x, y, z) {                                     //
                    var c = 0,                                              //
                        b = {                                               //
                            a: '1'                                          //
                          , c: '2'                                          //
                          , d: '4'                                          //
                        };                                                  //
                    return b.a;                                             //
                },                                                          //
                f = 'yea';                                                  //
        },                                                                  //
        xy3 = 'abc';                                                        //

    var a1 = 1,                                                             //
        b1 = 'test',                                                        //
        c1 = 'hello',                                                       //
        d1 = new Date(),                                                    //
        f  = function(x) { console.log(x); },                               //
        h  = function(y, z) {                                               //
            console.log(y, z);                                              //
        },                                                                  //
        foo = function() {                                                  //
            return 9;                                                       //
        };                                                                  //

    var x1 = 8,                                                             //
        ob1 = {                                                             //
            holla: 'what',                                                  //
            dutch: 'que pasa',                                              //
            test1: 3                                                        //
        },                                                                  //
        baz = function(x, y) {                                              //
            return 9;                                                       //
        },                                                                  //
        z3 = function(w) {                                                  //
            return 9;                                                       //
        };                                                                  //

    var w1 = 'a'                                                            //
      , w2 = function(y, z4) {                                              //
            if (ob1) {                                                      //
                return 'w';                                                 //
            } else {                                                        //
                return 7;                                                   //
            }                                                               //
        }                                                                   //
      , w3 = {                                                              //
            f1: 'a',                                                        //
            f2: 'b'                                                         //
        };                                                                  //

    var x8 = 9                                                              //
       ,x3 = 8                                                              //
       ,x5 = 9;                                                             //

    var a = 1,                                                              //
        b = 3,                                                              //
        c = a + b,                                                          //
        e = 'f',                                                            //
        d = e;                                                              //

    var a2 = 1                                                              //
      , b2 = a + 3                                                          //
      , c2 = b - 1 + a;                                                     //

    var a3 = 1                                                              //
      , b3 = 'test'                                                         //
      , c3 = 'hello'                                                        //
      , d3 = new Date()                                                     //
      , f3 = function(x) { console.log(x); }                                //
      , h3 = function(y, z) {                                               //
            console.log(y, z);                                              //
        };                                                                  //

    var e3 = function(z) {                                                  //
            var y = z;                                                      //
        };                                                                  //

    for (i = 0; i < items.length; i += 1) {                                 //
        html[i] = itemHtml(items[i]);                                       //
    }                                                                       //
    if (true) {                                                             //
        if (x === 8) {                                                      //
            return 9;                                                       //
        } else {                                                            //
            return 10;                                                      //
        }                                                                   //
        if (x === 'c') { return 12; }                                       //

        var fn = function (bar) {                                           //
                return bar + '';                                            //
            },                                                              //
            callback = function(x, y, z) {                                  //
                console.log(x, y, z);                                       //
                return x + y - z;                                           //
            },                                                              //
            k = {                                                           //
                items: [                                                    //
                    "one",                                                  //
                    "two",                                                  //
                    "three"                                                 //
                ],  // {                                                    //
                obj: {                                                      //
                    a: "this is a function(",                               //
                    b: "what",                                              //
                    c: ["array }",                                          //
                        /^]$/,                                              //
                        "bleu", "gris",                                     //
                        /fun{/                                              //
                    ]                                                       //
                }                                                           //
            },                                                              //
            bar = function(x) {                                             //
                return x;                                                   //
            };                                                              //

        var s = /* coment {} / \ got'cha\\ */ concat(Object                 //
               .keys);                                                      //

        var s1 = function(x,                                                //
                y,                                                          //
                z) {                                                        //
                    return 2;                                               //
            };                                                              //

        var s2 = "function((" + "  x / y)" + "({ z, w well it's right" + bar(s1);
        var s4 = "function((" + "  x / y)" + "({ z, w well it\"s right" + bar(s1);
        var s3 = 'function((' + '  x / y)' + '({ z, w well it\'s right' + bar(s1);
        var r2 = /function((/ + / x\/y)/ + /({z, w/i.test(s2);

        (a / b); // c                                                       //
        '' + "'" + ; // ' (                                                 //

        /*                                                                  //
         * this is a cool function                                          //

         this line gets no star                                             //
         * I think I'll write another                                       //
         * space                                                            //
         */                                                                 //
        var one = function(hello) {                                         //
                return hello + 'goodbye';                                   //
            };                                                              //
        var two = fn(bar(x,foo(y,z)));                                      //

        var three = fn(foo(x, bar(y, z)),                                   //
                9);                                                         //

        var four = fn(foo(x, bar(y,                                         //
                z, soo(w, x, { a: 1, b: [ 'here', 'abc' ] }),               //
                8), 9));                                                    //

        return '<div class="foo">' + html.join(', ') + '</div>';            //
    }                                                                       //

    var o1 = {                                                              //
            field1: [ "one",                                                //
                "two",                                                      //
                "three",                                                    //
                "four" ],                                                   //
            field2: {                                                       //
                inner: [ "japan",                                           //
                    "china",                                                //
                    "us",                                                   //
                    "hello"] } };                                           //
    //}                                                                     //
    //};                                                                    //
    var bar2 = function(x) {                                                //
            console.log(x);                                                 //
        };                                                                  //
}

if (searchableCollection(allYourStuff).contains(theStuffYouWant) &&         //
    !ambientNotification.isActive() && (client.isAmbientSupported() ||      //
        client.alwaysTryAmbientAnyways())) {                                //
    ambientNotification.activate(); }                                       //
//}                                                                         //

if (searchableCollection(allYourStuff).contains(theStuffYouWant) &&         //
    !ambientNotification.isActive() && (client.isAmbientSupported() ||      //
        client.alwaysTryAmbientAnyways())) {                                //
    ambientNotification.activate();                                         //
}                                                                           //

var modified = arr
       .concat([1])                                                         //
       .concat(Object.keys({}).map(function(key) {                          //
            return key;                                                     //
        }))                                                                 //
       .concat([1].map(function(x) {                                        //
            return x + 1;                                                   //
        }))                                                                 //
       .concat(Object                                                       //
           .keys({                                                          //
                a: 1,                                                       //
                b: 2,                                                       //
                c: 3                                                        //
            })                                                              //
           .filter(function (x) { return x % 2 === 0; })                    //
           .take(2))                                                        //
       .take(function(x) {                                                  //
            var a = arr,                                                    //
                b = a.length,                                               //
                c = a + b;                                                  //
            return c;                                                       //
        });                                                                 //


var k = foo(Object                                                          //
       .keys()                                                              //
       .map(function (k) {                                                  //
            return k + 1;                                                   //
        })                                                                  //
       .filter(function (k) { return k % 2 === 0; }));                      //

var barista = sbucks(Object                                                 //
       .keys()                                                              //
       .take(9)                                                             //
       .skip(2)                                                             //
       .map(function(k) { return k + 'a'; })),                              //
    hello = 'a',                                                            //
    gbye = 'b' + hello;                                                     //

var alpha = 'halo',                                                         //
    beta  = 'omega',                                                        //
    gamma = alpha                                                           //
       .chars()                                                             //
       .take(3);                                                            //

var open = foo(alpha,                                                       //
        beta,                                                               //
        gamma) ( function () {                                              //
            var k = alpha                                                   //
                   .take(8)                                                 //
                   .filter(beta)                                            //
              , m = gamma * 4                                               //
              , fn = function() {                                           //
                    return m;                                               //
                },                                                          //
              , t = 'test'                                                  //
              , n = n / 9;                                                  //
            console.log(k);                                                 //
            return k;                                                       //
    });                                                                     //

var l = list(a, b, 9)                                                       //
       .map(toStr)                                                          //
       .filter(bar)                                                         //
       .take(8)                                                             //
       .reduce(function (acc, x) {                                          //
            return acc + x;                                                 //
        })                                                                  //
  , me = this                                                               //
  , base = parent;                                                          //

var arr = function () {                                                     //
        var kkk = [1, 3]                                                    //
               .map(function (x) {                                          //
                    return x * 2;                                           //
                })                                                          //
               .filter(function (x) {                                       //
                    return y % 3 === 0;                                     //
                })                                                          //
          , bbb = kkk                                                       //
               .take(8)                                                     //
               .filter(function (x) {                                       //
                    return x % 5 == 1;                                      //
                }                                                           //
          , ccc = 23;                                                       //

        var kkk2 = [1, 3]                                                   //
               .map(function (x) {                                          //
                    return x * 2;                                           //
                })                                                          //
               .filter(function (x) {                                       //
                    return y % 3 === 0;                                     //
                }),                                                         //
            bbb2 = kkk                                                      //
               .take(8)                                                     //
               .filter(function (x) {                                       //
                    return x % 5 == 1;                                      //
                },                                                          //
            ccc2 = 23,                                                      //
            ddd2 = 'cool';

        return kkk;                                                         //
    };                                                                      //

var s = 9                                                                   //
  , k = 8                                                                   //
  , f = function (x) {                                                      //
        return hola;                                                        //
    }                                                                       //
  , b = function (y, w) {                                                   //
        console.log('a');                                                   //
        return 'OK';                                                        //
    };                                                                      //

arr                                                                         //
   .concat([1])                                                             //
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

window.list = ['one'                                                        //
  , 'two'                                                                   //
  , 'three'                                                                 //
  , 'four' ]                                                                //
       .map(toNum)                                                          //
       .take(4)                                                             //
       .filter(function (n) {                                               //
            return n % 3 === 0;                                             //
        })                                                                  //
       .map(toStr);                                                         //

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

var names = prefix.something.myExcellentMapFunction(                        //
        verboselyNamedCollectionOfItems,                                    //
        function(item) {                                                    //
            return item.name;                                               //
        });                                                                 //

var fn = function() {                                                       //
        window.list = arr                                                   //
           .take(9)                                                         //
           .map(toStr);                                                     //
        return 'done';                                                      //
    };                                                                      //

// = Case: AnonymousFunction (2)
(function(x)                                                                //
    {                                                                       //
        x;                                                                  //
        y;                                                                  //
    })(x);                                                                  //

// = Case: Anonymous Function (2)
(function(x)                                                                //
    {                                                                       //
        x;                                                                  //
        y;                                                                  //
    }                                                                       //
)(x);                                                                       //

var ls = foo(a,                                                             //
        b,                                                                  //
        c)                                                                  //
           .map(toStr)                                                      //
           .take(8)                                                         //
           .filter(function (x) {                                           //
                return x > 4;                                               //
            });                                                             //

function max() {                                                            //
    var el = elem.documentElement;                                          //
    return Math.max(                                                        //
        el["client" + name],                                                //
        elem.body["scroll" + name], el["scroll" + name],                    //
        elem.body["offset" + name], el["offset" + name]                     //
    );                                                                      //
    // comment                                                              //
}                                                                           //

var xs = function(a,                                                        //
        b,                                                                  //
        c) {                                                                //
            return 'hola';                                                  //
    },                                                                      //
    boo = 'what',                                                           //
    que = 'hefe';                                                           //

var w = function(a, b) {                                                    //
        var x = a                                                           //
               .map(function(x) {                                           //
                    console.log(x);                                         //
                    return x.y;                                             //
                })                                                          //
               .filter(function(x) {                                        //
                    var k = b                                               //
                           .take(10)                                        //
                           .filter(s)                                       //
                      , w = a                                               //
                           .take(8)                                         //
                           .map(function(x) { return x + ''; })             //
                      , s = 8;                                              //
                    var what = arr                                          //
                           .filter(k)                                       //
                           .take(4 + x)                                     //
                           .skip(8),                                        //
                        which = 9,                                          //
                        hello = 'test';                                     //
                    return k.concat(x);                                     //
                });                                                         //
        return x;                                                           //
    };

var names = prefix.something.myExcellentMapFunction(                        //
        verboselyNamedCollectionOfItems,                                    //
        function(item) {                                                    //
            return item.name;                                               //
        }),                                                                 //
    coolite = 'juliet';                                                     //

var f1 = lst                                                                //
       .map(tosStr)                                                         //
       .filter(function (x) {                                               //
            return x > 9;                                                   //
        })                                                                  //
  , f3 = 'var'                                                              //
  , f4 = 'cool';

var fn1 = function(x, y) {                                                  //
        return x + y;                                                       //
    },                                                                      //
    fn2 = function(w, z) {                                                  //
        return w;                                                           //
    };                                                                      //
//
function kk2 () {                                                           //
    console.log(8);                                                         //
}                                                                           //
