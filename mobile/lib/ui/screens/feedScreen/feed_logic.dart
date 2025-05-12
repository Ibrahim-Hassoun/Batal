import '../../../core/remote/server.dart';

Future<void> loadPosts() async {
  var response = await request(
    endpoint: '/api/v0.1/posts/following', 
    method: 'GET');
  if(response['success']){
    print('these are the retrieved posts');
    print(response['data']['data']);
    return response['data']['data'];
  }
}