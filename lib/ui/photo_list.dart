import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/model/models.dart';
import 'package:flutter_ui_collections/services/services.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosList extends StatefulWidget {
  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> implements ApiListener {
  bool isLoading = true;
  bool internetCheck = true;
  List<PhotoResponse> photoList= new List();
  Screen size;

  @override
  void initState() {
    super.initState();
    WebServices(this).getListOfPhotos(context);
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return staggeredBody();
  }

  Padding staggeredBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:size.getWidthPx(8)),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: photoList.length,
        padding: EdgeInsets.only(top: size.getWidthPx(8)),
        itemBuilder: (BuildContext context, int index) => Container(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.getWidthPx(8)),
                  border: Border.all(color: hintTextColor),
                  image: DecorationImage(
                      image: NetworkImage(photoList[index].urls.small),
                      fit: BoxFit.cover))),
        ),

        staggeredTileBuilder: (int index) => StaggeredTile.count(1, index.isEven ? 1.5 : 1),
        mainAxisSpacing: size.getWidthPx(4),
        crossAxisSpacing: size.getWidthPx(4),
      ),
    );
  }

  @override
  void onApiFailure(Exception exception) {
    Utils.showAlert(context, "Photos", "Something went wrong.", () {
      Navigator.pop(context);
    }, true);
  }

  @override
  void onApiSuccess(Object mObject) {
    //Get All Users
    if (mObject is List<PhotoResponse>) {
      photoList.addAll(mObject);
    }
  }

  @override
  void onNoInternetConnection() {

  }


}