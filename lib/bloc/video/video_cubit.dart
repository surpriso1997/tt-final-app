import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tik_tok_app/model/video.dart';
import 'package:path_provider/path_provider.dart';
part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  int currentPage = 1;

  List<Hit> allHits = [];

  final url = "https://pixabay.com/api/videos";

  fetchVideos() async {
    emit(VideosLoading());
    try {
      final reponse = await Dio(BaseOptions(receiveDataWhenStatusError: true))
          .get(url, queryParameters: {
        "key": "24747090-95c20607d87e00f7bea20cb40",
        "page": 1,
        "per_page": 5
      });

      print(reponse.statusCode);

      ///

      ///
      List _hits = reponse.data['hits'];

      List<Hit> hitsData = _hits.map<Hit>((e) => Hit.fromJson(e)).toList();

      allHits.addAll(hitsData);

      List exampleList = ["a", "b", "c"];
      List anotherList = [
        "some values",
        "this value",
        ...exampleList,
        " :",
        "anotehr value",
        ...exampleList
      ];

      emit(VideosFetchSuccess(data: hitsData));
    } catch (e, s) {
      print(e);
      print(s);
      emit(VideosError(errorMessage: e.toString()));
    }
  }

  loadMoreVideos() async {
    emit(VideoLoadingMoreData(data: allHits));

    currentPage++;

    print("loading more videos of page number: $currentPage");
    print("all videos length is :: ${allHits.length}");
    try {
      final qParams = {
        "key": "24747090-95c20607d87e00f7bea20cb40",
        "page": currentPage,
        "per_page": 5
      };

      final loadMoreResponse =
          await Dio(BaseOptions(receiveDataWhenStatusError: true))
              .get(url, queryParameters: qParams);

      print(loadMoreResponse.statusCode);

      ///

      ///
      List _hits = loadMoreResponse.data['hits'];

      List<Hit> loadedMoreHits =
          _hits.map<Hit>((e) => Hit.fromJson(e)).toList();

      allHits.addAll(loadedMoreHits);

      emit(VideosFetchSuccess(data: allHits));
    } catch (e, s) {
      print(e);
      print(s);
      emit(VideosError(errorMessage: e.toString()));
    }
  }

  uploadVideo(File file) async {
    ///

    final dir = await getApplicationDocumentsDirectory();

    /// creating a file
    File photo = File(dir.path + "a.mp3");

    // var fileList = photo.readAsBytesSync();
// var multiPartImage= MultipartFile.fromBytes(fileList, filename: "a.mp3");

    /// creating a multi part file or upload
    var mp2 = await MultipartFile.fromFile(photo.path);

    /// using formdata in dio
    final res = await Dio().post("https://ourserver/media/",
        data: FormData.fromMap({"media": mp2}));
  }
}
