import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_union/models/img_model.dart';

class ImageRepo {
  ImageRepo({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;

  Stream<List<ImageModel>> getAllImages() async* {
    yield* _fireStore.collection('photos').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => ImageModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
