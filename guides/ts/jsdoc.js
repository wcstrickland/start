
// jsDoc comments can be used to better document javascript providing info to the ide such as function signatures
// jsDoc can also be used to enable type checking of vanilla JS by adding
//   "js/ts.implicitProjectConfig.checkJs" : true to vs code prefrences> settings.json
// https://jsdoc.app/ for @decorators and usage


/**
 * install jsdoc
 * sudo npm i -g jsdoc 
 * 
 * jsdoc *.js -d docs
 * 
 * create documentation for all js files and put it in a folder named docs
 * 
 * 
 */




/**
 * 
 * @param {string} str 
 * @returns {boolean}
 */
function brackets(str) {
    /**
     * @type {Object.<string,string>}
     */
    let brkts = { "}": "{", "]": "[", ")": "(", }
    /**
     * @type {string[]}
     * 
     */
    let stack = [];
    for (let el of [...str]) {
        if (Object.values(brkts).includes(el)) {
            stack.push(el)
        }
        if (Object.keys(brkts).includes(el)) {
            let popped = stack.pop();
            if (popped !== brkts[el]) return false;
        }
    }
    return stack.length === 0;
}

function fizzBuzz(num) {
    return "fizz".repeat(num % 3 === 0) + "buzz".repeat(num % 5 === 0) || num;
}

function recurFib(n) {
    if (n <= 1) { return n }
    return recurFib(n - 1) + recurFib(n - 2)
}

/**
 * 
 * @param {number} n 
 * @returns {number}
 */
function iterFib(n) {
    let [first, second] = [1, 2]
    for (let i = 0; i < n - 2; i++) {
        [first, second] = [second, first + second]
    }
    return n < 2 ? first : second
}


/**
 * 
 * @param {number[]} nums 
 * @param {number} target 
 * @returns {number[]}
 */
function twoNumSum(nums, target) {

    /**
     * @type {Object.<number, boolean>}
     */
    let available = {};

    for (let num of nums) {
        let needed = target - num;
        if (available[needed]) {
            return [needed, num]
        }
        available[num] = true;
    }

    return [-1]
}

/**
 * returns the index of value `target` in array `arr` or -1 if not present from a `SORTED` array
 * @param {number[]} arr `number[]` 
 * @param {number} target `number`
 * @returns {number} `number`
 */
function binSearch(arr, target) {
    /**
     * @type {number}
     */
    let left = 0;
    /**
     * @type {number}
     */
    let right = arr.length - 1
    while (left <= right) {
        /**
         * @type {number}
         */
        let middle = Math.floor((left + right) / 2)
        if (arr[middle] === target) return middle;
        arr[middle] < target ? left = middle + 1 : right = middle - 1
    }
    return -1
}

console.log(binSearch([1, 4, 6, 9, 10, 11], 10))