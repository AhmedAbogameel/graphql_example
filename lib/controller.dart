import 'dart:developer';

import 'package:graphql/client.dart';
import 'package:graphql_example/model.dart';

class Controller {

  bool isLoading = true;

  Model? model;

  final _httpLink = HttpLink(
    'https://api.graphql.jobs/',
  );

  String document = r'''
  query get() {
    countries {
      name
    }
 }
''';

  Future<void> getData() async {
    final QueryResult result = await GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    ).query(QueryOptions(
        document: gql(document)
    ));
    try{
      model = Model.fromJson(result.data!);
    }catch(e, s){
      print(e);
      print(s);
    }
  }

}