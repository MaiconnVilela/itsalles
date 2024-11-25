import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnderecoRecord extends FirestoreRecord {
  EnderecoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Local" field.
  String? _local;
  String get local => _local ?? '';
  bool hasLocal() => _local != null;

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _local = snapshotData['Local'] as String?;
    _img = snapshotData['Img'] as String?;
    _link = snapshotData['Link'] as String?;
    _data = snapshotData['Data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Endereco');

  static Stream<EnderecoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnderecoRecord.fromSnapshot(s));

  static Future<EnderecoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnderecoRecord.fromSnapshot(s));

  static EnderecoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnderecoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnderecoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnderecoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnderecoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnderecoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnderecoRecordData({
  String? local,
  String? img,
  String? link,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Local': local,
      'Img': img,
      'Link': link,
      'Data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnderecoRecordDocumentEquality implements Equality<EnderecoRecord> {
  const EnderecoRecordDocumentEquality();

  @override
  bool equals(EnderecoRecord? e1, EnderecoRecord? e2) {
    return e1?.local == e2?.local &&
        e1?.img == e2?.img &&
        e1?.link == e2?.link &&
        e1?.data == e2?.data;
  }

  @override
  int hash(EnderecoRecord? e) =>
      const ListEquality().hash([e?.local, e?.img, e?.link, e?.data]);

  @override
  bool isValidKey(Object? o) => o is EnderecoRecord;
}
