import 'package:mobile/core/remote/server.dart';
import 'package:mobile/ui/screens/chats_screen/chats_screen.dart';


Future <List<dynamic>>  fetchChats(ChatsScreenState chatsScreenState) async{
  chatsScreenState.loading = true;
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/chat/conversations/all',
    method: "GET");

    if(response['success']){
      chatsScreenState.loading = false;
      return response['data']['data']['original']['data'];
    }
    else{
      throw Exception('Could not load rows');
    }
}