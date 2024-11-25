import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CapaAulasRecord extends FirestoreRecord {
  CapaAulasRecord._(
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
      FirebaseFirestore.instance.collection('CapaAulas');

  static Stream<CapaAulasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CapaAulasRecord.fromSnapshot(s));

  static Future<CapaAulasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CapaAulasRecord.fromSnapshot(s));

  static CapaAulasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CapaAulasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CapaAulasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CapaAulasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CapaAulasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CapaAulasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCapaAulasRecordData({
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class CapaAulasRecordDocumentEquality implements Equality<CapaAulasRecord> {
  const CapaAulasRecordDocumentEquality();

  @override
  bool equals(CapaAulasRecord? e1, CapaAulasRecord? e2) {
    return e1?.img == e2?.img;
  }

  @override
  int hash(CapaAulasRecord? e) => const ListEquality().hash([e?.img]);

  @override
  bool isValidKey(Object? o) => o is CapaAulasRecord;
}
