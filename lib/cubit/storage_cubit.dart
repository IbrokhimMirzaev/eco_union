import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_union/cubit/status.dart';
import 'package:eco_union/models/img_model.dart';
import 'package:eco_union/repos/img_repo.dart';
import 'package:equatable/equatable.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  StorageCubit({
    required ImageRepo imageRepo,
  })  : _imageRepo = imageRepo,
        super(const StorageState(images: []));

  final ImageRepo _imageRepo;
  late StreamSubscription _subscriptionAll;

  Future<void> listenToImages() async {
    emit(state.copyWith(status: Status.LOADING));
    _subscriptionAll = _imageRepo.getAllImages().listen(
      (images) {
        emit(state.copyWith(images: images, status: Status.SUCCESS));
      },
      onError: (error) {
        emit(state.copyWith(errorText: error.toString(), status: Status.ERROR));
      },
    );
  }

  @override
  Future<void> close() {
    _subscriptionAll.cancel();
    return super.close();
  }
}
