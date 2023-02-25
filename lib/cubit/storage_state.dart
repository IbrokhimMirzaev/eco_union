part of 'storage_cubit.dart';

class StorageState extends Equatable {
  final List<ImageModel> images;
  final Status status;
  final String errorText;

  const StorageState({
    required this.images,
    this.status = Status.PURE,
    this.errorText = '',
  });

  StorageState copyWith({
    List<ImageModel>? images,
    Status? status,
    String? errorText,
  }) =>
      StorageState(
        images: images ?? this.images,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [images, status, errorText];
}
