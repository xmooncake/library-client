// class PublicationsImpl extends PublicationsRepository {
//   PublicationsImpl() : super();

//   @override
//   Future<List<Publication>> getPublications() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       final List<dynamic> json = jsonDecode(response.body);
//       return json.map((e) => Publication.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load publications');
//     }
//   }
// }
