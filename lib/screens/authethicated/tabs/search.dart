import 'package:flutter/material.dart';
import 'package:instagram/screens/search_results.dart';

class SearchScreen extends StatefulWidget {
   SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  
  FocusNode focus = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    focus.addListener(() {
      if(focus.hasFocus)
      {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) {return SearchResults();}));
         focus.unfocus();
         

      }
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color.fromARGB(255, 212, 212, 212),),
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.search_rounded, color: Colors.black,),
                  ),
                  Expanded(
                    child: 
                      TextField(

                      controller: _textEditingController,
                      focusNode: focus,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Search...",
                      border: InputBorder.none,    
                    )),                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Expanded(child: 
       
          GridView.builder(itemCount: 20, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10 ), 
          itemBuilder: (context, index)
          {
            return Container(color: Colors.pink[200]);
          }
          )
        
       

          
         ) 
        
        ],
      ),
    );
  }
}
