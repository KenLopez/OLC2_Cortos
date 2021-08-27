const { parser } = require("./analizador/c3d");

const entrada = "(x+y)/(y*x)+z-j/(y-z)";

try{
    parser.parse(entrada);
}catch (err){
    console.log(err);
}