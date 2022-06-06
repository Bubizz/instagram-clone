import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram/screens/authethicated/new_post/add_caption.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  File? image;
  final _pagingController = PagingController<int, AssetEntity>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPhotos(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _fetchPhotos(int page) async {
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      final List<AssetPathEntity> path = await PhotoManager.getAssetPathList(
        onlyAll: true,
      );
      var temp = await path[0].getAssetListPaged(page: page, size: 64);
      _pagingController.appendPage(temp, ++page);
    } else {
      _fetchPhotos(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Gallery",
            style: AppBarTheme.of(context).titleTextStyle,
          ),
          leading: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Center(
                child: IconButton(
              color: Colors.blue,
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AddImgCaption(image: image!);}));
              },
            ))
          ],),
      body: Column(children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          child: image == null
              ? Center(
                  child: Image.asset(
                  "assets/add-camera.png",
                  width: 50,
                  height: 50,
                ))
              : Image.file(image!, fit: BoxFit.cover,)
        ),
        Expanded(
          child: PagedGridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<AssetEntity>(
                itemBuilder: (context, item, index) {
              return FutureBuilder(
                  future:
                      item.thumbnailDataWithSize(const ThumbnailSize(210, 210)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GestureDetector(
                        onTap: () {
                          item.file.then((value) {
                            setState(() {
                              image = value;
                            });
                          });
                        },
                       
                        child: Image.memory(
                          snapshot.data as Uint8List,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return Container();
                  });
            }),
          ),
        ),
      ]),
    );
  }
}
