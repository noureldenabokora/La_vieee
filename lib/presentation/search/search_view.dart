import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/presentation/search/search_widget.dart';

class SearchView extends StatefulWidget {
  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  // late List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();

    //  books = allBooks;
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  buildSearch(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.plattts.length,
                      itemBuilder: (context, index) {
                        //  final book = books[index];

                        return buildItme(cubit, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
        //controller: search,
      );

  Widget buildItme(AppCubit cubit, index) => ListTile(
        title: Text(cubit.searchModel.data!.plants![index].name!),
        //    subtitle: Text(book.author),
      );

  Future searchBook(String query) async {
    final books = await AppCubit.get(context).getSearch(query);

    setState(() {
      this.query = query;
      //   this.books = books;
    });
  }
}
