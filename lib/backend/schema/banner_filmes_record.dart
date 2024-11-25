import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerFilmesRecord extends FirestoreRecord {
  BannerFilmesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _img = snapshotData['Img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BannerFilmes');

  static Stream<BannerFilmesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerFilmesRecord.fromSnapshot(s));

  static Future<BannerFilmesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerFilmesRecord.fromSnapshot(s));

  static BannerFilmesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannerFilmesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerFilmesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerFilmesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerFilmesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerFilmesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerFilmesRecordData({
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerFilmesRecordDocumentEquality
    implements Equality<BannerFilmesRecord> {
  const BannerFilmesRecordDocumentEquality();

  @override
  bool equals(BannerFilmesRecord? e1, BannerFilmesRecord? e2) {
    return e1?.img == e2?.img;
  }

  @override
  int hash(BannerFilmesRecord? e) => const ListEquality().hash([e?.img]);

  @override
  bool isValidKey(Object? o) => o is BannerFilmesRecord;
}
