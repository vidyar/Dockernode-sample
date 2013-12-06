var express = require('express');
var mongoose = require ('mongoose');
var app = exports.app = express();

//connect to mongo db
mongoose.connect('mongodb://localhost/mylist');
var myDB=mongoose.connection;

//Error handling if connection fails
myDB.on('error', console.error.bind(console, 'connection error:'));

//check if connection is successful
myDB.once('open', function callback () {
console.log("my DB connected with mongoose" );
});

//define model
var Schema = mongoose.Schema;
var UserSchema = new Schema({
name : String
});

var User=mongoose.model('user',UserSchema);
var user=new User();

app.use(express.bodyParser());
app.get('/',function(request, response) {
 response.sendfile('/views/index.html');
});

app.post('/',function(req,res){
console.log('Callback');
var uname=req.body.name;
console.log('User: ' +uname);
user.name= uname;
user.save(function(err, user_Saved){
	if (err){
		throw err;
		console.log(err);
		}
	else {
		console.log('name saved to mongodb!');
	}
}

);
res.end();
});
console.log('Server started');

app.listen(3000);

