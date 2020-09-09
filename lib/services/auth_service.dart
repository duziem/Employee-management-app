import 'package:beloxxi_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beloxxi_app/services/database.dart';



class AuthService{

final FirebaseAuth _auth= FirebaseAuth.instance;

//create user obj based on FirebaseUser
User _userFromFirebaseUser(user){
  return user != null? User(uid: user.uid): null;
}

//auth change user stream
Stream<User> get user {
  return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
}


Stream<String> get userId {
  return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user).uid);
}

//get current user object
Future currentUser() async{
  FirebaseUser user= await _auth.currentUser();
  return  _userFromFirebaseUser(user);
}

/*
//Register user with Email and Password
Future registerUserWithEmailAndPassword(String email, String password, String name, String serialno, String position, String lockerno) async{
  try{
    AuthResult result= await _auth.createUserWithEmailAndPassword(email: email,password: password);
    FirebaseUser user= result.user;

    //create a new document for the user with the user id
    await DatabaseService(uid: user.uid).saveUserData(name: name, serialno: serialno, position: position, lockerno: lockerno, email: email, password: password);
    return  _userFromFirebaseUser(user);
  }catch(e){
    print('Error entering Beloxxi user data');
    return null;
  }
}
*/

//Register user with Email and Password
Future registerUserWithEmailAndPassword(String email, String password, String name,String dateOfBirth,String serialno) async{
  try{
    AuthResult result= await _auth.createUserWithEmailAndPassword(email: email,password: password);
    FirebaseUser user= result.user;
     await DatabaseService(uid: user.uid).saveUserData(email: email, password: password, name: name, dateOfBirth: dateOfBirth, serialno:serialno);
    return  _userFromFirebaseUser(user);
  }catch(error){
    print('Error entering Beloxxi user data');
    return null;
  }
}

//Sign in user with Email and Password
Future signInUserWithEmailAndPassword(String email, String password) async{
  try{
    AuthResult result= await _auth.signInWithEmailAndPassword(email: email,password: password);
    FirebaseUser user= result.user;
    print(user);
    return _userFromFirebaseUser(user);
  }catch(error){
     print('Error entering Beloxxi user data');
    return null;
  }
}

/*
Future signInAnon() async{
  try{
    AuthResult result= await _auth.signInAnonymously();
    FirebaseUser user= result.user;
    print(user);
    return _userFromFirebaseUser(user);
  }catch(e){
     print('Error entering Beloxxi user data');
    return null;
  }
}
*/

//sign out
Future signOut() async{
  try{
    return await _auth.signOut();
  }catch(error){
    print(error.toString());
    return null;
  }
}
}
