// import 'dart:async';
// import 'dart:convert';

// import '../model/user_model.dart';
// import 'package:http/http.dart' as http;

// enum UserAction
// {
//   FETCH_USERS
// }

// class UsersBloc
// {
// StreamController<List<User>> userController=StreamController<List<User>>();
// StreamSink get userSink=> userController.sink;
// Stream get userStream => userController.stream;

// StreamController<UserAction> eventController=StreamController<UserAction>();
// StreamSink get eventSink=> eventController.sink;
// Stream get eventStream => eventController.stream;

// UsersBloc()
// {
//   eventStream.listen((event) async{
//     if(event==UserAction.FETCH_USERS)
//     {
//       try {
//         var listUsers=fetchUsers();
//         userSink.add(listUsers);
//       } on Exception catch (e) {
//               userSink.addError('Something went wrong');
//       }
//     }
//   });
// }

// Future<List<User>> fetchUsers() async{
//   final response= await http.get('https://jsonplaceholder.typicode.com/users');
//   if(response.statusCode==200)
//   {
//   final userList=json.decode(response.body);
//   List<User> temp = (userList as List)
//         .map((itemWord) => User.fromJson(itemWord))
//         .toList();
//   return temp;
//   }
//   return null;
// }
// void dispose()
// {
//   eventController.close();
// userController.close();
// }
// }