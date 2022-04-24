// tsc -w will run the compiler in watch mode
// tsc --init to create a tsconfig.json
// change target to "esnext"
// watch true
// "lib" : ["dom", "es2017"]
// npm i -D @types/put_your_3rd_party_library_here


let lucky = 7; // implicit typing

let later: number;  // decleration without assignment

type MyType = string; // alias a primitive type

// interfaces are like structs
interface Person {
     first: string; // mandatory properties
     last: string;
     [key: string]: any;  // optional properties with mandatory shape
}

// function type anotations
function multiply(x:number, y:number):number{
    return x * y
}

function helloYou(you:string):void{
    console.log(`hello ${you}`)
}


//typing built in structures
const arr: number[] = [];
// arr.push("this will show an error in editor")


// union typing
type StringNum = string|number;
const unionArr: StringNum[] = []
unionArr.push(1)
unionArr.push("1")

// Tuple
// a list of fixed length where each position has an expected type
// ? will denote non mandatory values
type t_uple = [number, string, boolean?]



// Generics and classes
// <T> placeholder for type
class Observable<T>{
    //properties must be declared and typed before constructor sets them
    // public and private 
    public value: T;
    private secret: string;
    
    constructor(value : T){
        this.value = value
        this.secret = "this is a secret"
    }
}