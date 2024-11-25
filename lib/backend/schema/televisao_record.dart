import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TelevisaoRecord extends FirestoreRecord {
  TelevisaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Radio" field.
  String? _radio;
  String get radio => _radio ?? '';
  bool hasRadio() => _radio != null;

  void _initializeFields() {
    _radio = snapshotData['Radio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Televisao');

  static Stream<TelevisaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TelevisaoRecord.fromSnapshot(s));

  static Future<TelevisaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TelevisaoRecord.fromSnapshot(s));

  static TelevisaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TelevisaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TelevisaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TelevisaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TelevisaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TelevisaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTelevisaoRecordData({
  String? radio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Radio': radio,
    }.withoutNulls,
  );

  return firestoreData;
}

class TelevisaoRecordDocumentEquality implements Equality<TelevisaoRecord> {
  const TelevisaoRecordDocumentEquality();

  @override
  bool equals(TelevisaoRecord? e1, TelevisaoRecord? e2) {
    return e1?.radio == e2?.radio;
  }

  @override
  int hash(TelevisaoRecord? e) => const ListEquality().hash([e?.radio]);

  @override
  bool isValidKey(Object? o) => o is TelevisaoRecord;
}
