import 'package:flutter/material.dart';

import '../../../core/remote/server.dart';

Future<List< dynamic>> loadPosts() async {
  print('started method load postsssssssss');
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/posts/following', 
    method: 'GET');
  print('after response');
  if(response['success']){
    print('these are the retrieved posts');
    print(response['data']['data']['data']);
    return response['data']['data']['data'];
  }
  throw Exception('Failed to load posts');
}

Future<void> addReaction(BuildContext context) async{
  
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/posts/addReaction',
    method: 'POST');

}