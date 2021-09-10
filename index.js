const { parser } = require("./analizador/c3d");

const entrada = 
`not not not a<b`;

try{
    parser.parse(entrada);
}catch (err){
    console.log(err);
}