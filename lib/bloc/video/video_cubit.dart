import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tik_tok_app/model/video.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  int currentPage = 1;

  List<Hit> allHits = [];

  final url = "https://pixabay.com/api/videos";

  fetchVideos() async {
    emit(VideosLoading());
    try {
      final response = await Dio(BaseOptions(receiveDataWhenStatusError: true))
          .get(url, queryParameters: {
        "key": "24747090-95c20607d87e00f7bea20cb40",
        "page": 1,
        "per_page": 5
      });

      print(response.statusCode);

      ///

      ///
      List _hits = response.data['hits'];

      List<Hit> hitsData = _hits.map<Hit>((e) => Hit.fromJson(e)).toList();

      allHits.addAll(hitsData);

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
      final response = await Dio(BaseOptions(receiveDataWhenStatusError: true))
          .get(url, queryParameters: {
        "key": "24747090-95c20607d87e00f7bea20cb40",
        "page": currentPage,
        "per_page": 5
      });

      print(response.statusCode);

      ///

      ///
      List _hits = response.data['hits'];

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
}
