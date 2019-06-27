import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/model/models.dart';
import 'package:flutter_ui_collections/services/services.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:http/http.dart' as http;

class WebServices {
  ApiListener mApiListener;

  final JsonDecoder _decoder = new JsonDecoder();

  WebServices(this.mApiListener);

  //This Function executed after any Success call of API
  void _onSuccessResponse(Object mObject) {
    mApiListener.onApiSuccess(mObject);
  }

  // This Function executed after any failure call of API

  void _onFailureResponse(Object mThrowable) {
    // Call on failure method of ApiListener Interface
    mApiListener.onApiFailure(mThrowable);
  }

  // This Function executed when internet connection is not available
  void _onNoInternetConnection() {
    mApiListener.onNoInternetConnection();
  }

  // This Function will get list of Photos from web-server.
  void getListOfPhotos(BuildContext context) async {
    if (await Utils.checkConnection()) {
      http.get(
        Constants.PHOTOSURL + Constants.PHOTOS,
        headers: {
          'Authorization': "Client-ID " + Constants.accessKey,
        },
      ).then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          _onFailureResponse(new Exception("Error while fetching data"));
        } else {
          final parsed = json.decode(res).cast<Map<String, dynamic>>();
          List<PhotoResponse> photosList = parsed
              .map<PhotoResponse>((json) => PhotoResponse.fromJson(json))
              .toList();
          _onSuccessResponse(photosList);
        }
      });
    } else {
      _onNoInternetConnection();
      Utils.showAlert(context, "Flutter", "Internet is not connected.", () {
        Navigator.pop(context);
      }, true);
    }
  }
}
