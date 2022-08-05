import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mk_movies_app/model/categories_modal.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  final _formkey = GlobalKey<FormState>();
  late CategoryMovies selectedCategory;

  late Future<List<CategoryMovies>> futureCategories;

  Future<List<CategoryMovies>> fetchCategories() async {
    http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/categories'),
    );

    List categories = jsonDecode(response.body);
    return categories
        .map((category) => CategoryMovies.fromJson(category))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Center(
        child: FutureBuilder<List<CategoryMovies>>(
          future: futureCategories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    CategoryMovies categoryMovies = snapshot.data![index];
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(categoryMovies.name),
                      subtitle: Text(categoryMovies.descriptions),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          selectedCategory = categoryMovies;
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Form(
                                    key: _formkey,
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          initialValue: categoryMovies.name,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Category Name'),
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        TextFormField(
                                          initialValue:
                                              categoryMovies.descriptions,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Descriptions'),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                child: Text('Save'),
                                                onPressed: () => saveCategory(
                                                    categoryMovies),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.grey),
                                                ),
                                                child: Text('Close'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ])
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(
                // 'Something went wrong!',
                "This is the error: ${snapshot.error}",
                style: TextStyle(color: Colors.red),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future saveCategory(CategoryMovies categoryMovies) async {
    String uri = '' + categoryMovies.id.toString();
    return 'OK';
  }
}
