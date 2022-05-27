import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: const BoxDecoration(
            color: Color.fromARGB(248, 61, 60, 60),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 30,
                height: 8,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10))),
              ),
            ),
            Text('Create', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),),
            const Divider(
              color: Color.fromARGB(255, 197, 197, 197),
              thickness: 1,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromARGB(255, 66, 66, 66),
                onTap: () {print("uwu");},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(children: [
                    const Icon(
                      Icons.grid_view,
                    ),
                    const Spacer(flex: 1,),
                    Text("Post", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 18),),
                    const Spacer(flex: 9,),
                  ]),
                ),
              ),
            ),
            const Divider(
                indent: 20, endIndent: 20, color: Color.fromARGB(255, 197, 197, 197), thickness: 1)
          ],
        ));
  }
}
