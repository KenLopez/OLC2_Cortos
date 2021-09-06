const { parser } = require("./analizador/c3d");

const entrada = 
`a*c<b+c`;

try{
    parser.parse(entrada);
}catch (err){
    console.log(err);
}