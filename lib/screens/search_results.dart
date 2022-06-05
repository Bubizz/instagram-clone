import 'package:flutter/material.dart';
import 'package:instagram/models/app_user.dart';
import 'package:instagram/services/db_methods.dart';
import 'package:instagram/widgets/user_list_tile.dart';

class SearchResults extends StatefulWidget {
  SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  var _searchedUsers = <AppUser>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  IconButton(
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 212, 212, 212),
                      ),
                      height: 40,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                                onSubmitted: (searchedname) async {
                                 
                                  _searchedUsers =
                                      await dbMethods().findUsers(searchedname);
                                  setState(() {
                                    
                                  });
                                },
                                autofocus: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: "Search...",
                                  border: InputBorder.none,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _searchedUsers.length,
                    itemBuilder: (context, index) {
                      return UserListTile(
                          user: _searchedUsers[index]);
                          
                    }))
          ],
        ),
      ),
    );
  }
}
