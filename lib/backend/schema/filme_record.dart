import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilmeRecord extends FirestoreRecord {
  FilmeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "SIM" field.
  bool? _sim;
  bool get sim => _sim ?? false;
  bool hasSim() => _sim != null;

  // "NAO" field.
  bool? _nao;
  bool get nao => _nao ?? false;
  bool hasNao() => _nao != null;

  void _initializeFields() {
    _sim = snapshotData['SIM'] as bool?;
    _nao = snapshotData['NAO'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('filme');

  static Stream<FilmeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FilmeRecord.fromSnapshot(s));

  static Future<FilmeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FilmeRecord.fromSnapshot(s));

  static FilmeRecord fromSnapshot(DocumentSnapshot snapshot) => FilmeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FilmeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FilmeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FilmeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FilmeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFilmeRecordData({
  bool? sim,
  bool? nao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SIM': sim,
      'NAO': nao,
    }.withoutNulls,
  );

  return firestoreData;
}

class FilmeRecordDocumentEquality implements Equality<FilmeRecord> {
  const FilmeRecordDocumentEquality();

  @override
  bool equals(FilmeRecord? e1, FilmeRecord? e2) {
    return e1?.sim == e2?.sim && e1?.nao == e2?.nao;
  }

  @override
  int hash(FilmeRecord? e) => const ListEquality().hash([e?.sim, e?.nao]);

  @override
  bool isValidKey(Object? o) => o is FilmeRecord;
}
