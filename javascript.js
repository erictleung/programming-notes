// Javascript Notes

// strings
var name = "Joe";
name.length; // get length of string
name[0]; // get "first" element of string
name[name.length - 1]; // get last element of string

// numbers
var number = 4; // set number
var other = (4 * 2) + 4; // combining operations
Math.random(); // creates floating point num 0 (incl) to 1 (excl)

// arrays
var sampleArray = ["Joe", 42]; // holds different data
var nested = [["Bob", 32]]; // make nested array
sampleArray[0]; // access first element, zero-indexed
sampleArray.pop(); // remove and return last element
sampleArray.push(42); // "push" data to last element
sampleArray.shift(); // remove first element
sampleArray.unshift("Joe"); // add data to first element

// functions
function ourFunction(a, b) {
    // do stuff here
    return a - b;
};