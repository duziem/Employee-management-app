
class User {
//create a var that stores the user uid property value from the FirebaseUser obect
 final String uid;
 final String name;
 final String dateOfBirth;

 User({this.uid, this.name, this.dateOfBirth});
}

//Try to use this model to store values of the textformfields 
//in the register component
class StaticUser {
//create a var that stores the user uid property value from the FirebaseUser obect
 static String uid;
 static String name;
 static String dateOfBirth;


}