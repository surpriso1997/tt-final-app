part of 'video_cubit.dart';

@immutable
abstract class VideoState extends Equatable {
  final List<Hit>? data;

  const VideoState({this.data});

  @override
  List get props => [];
}

class VideoInitial extends VideoState {}

class VideosLoading extends VideoState {}

class VideosError extends VideoState {
  final String errorMessage;
  VideosError({required this.errorMessage});
}

class VideosFetchSuccess extends VideoState {
  final List<Hit> data;
  VideosFetchSuccess({required this.data}) : super(data: data);

  @override
  List get props => [...data];
}

class VideoNoData extends VideoState {}

class VideoRefreshing extends VideoState {}

class VideoLoadingMoreData extends VideoState {
  final List<Hit> data;
  VideoLoadingMoreData({required this.data}) : super(data: data);
  @override
  List get props => [...data];
}
