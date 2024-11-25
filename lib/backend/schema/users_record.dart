import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "idcurso" field.
  bool? _idcurso;
  bool get idcurso => _idcurso ?? false;
  bool hasIdcurso() => _idcurso != null;

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "ADM" field.
  bool? _adm;
  bool get adm => _adm ?? false;
  bool hasAdm() => _adm != null;

  // "sobrenome" field.
  String? _sobrenome;
  String get sobrenome => _sobrenome ?? '';
  bool hasSobrenome() => _sobrenome != null;

  // "anotacao" field.
  String? _anotacao;
  String get anotacao => _anotacao ?? '';
  bool hasAnotacao() => _anotacao != null;

  // "Bacharel" field.
  bool? _bacharel;
  bool get bacharel => _bacharel ?? false;
  bool hasBacharel() => _bacharel != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _idcurso = snapshotData['idcurso'] as bool?;
    _capa = snapshotData['capa'] as String?;
    _nome = snapshotData['nome'] as String?;
    _adm = snapshotData['ADM'] as bool?;
    _sobrenome = snapshotData['sobrenome'] as String?;
    _anotacao = snapshotData['anotacao'] as String?;
    _bacharel = snapshotData['Bacharel'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? idcurso,
  String? capa,
  String? nome,
  bool? adm,
  String? sobrenome,
  String? anotacao,
  bool? bacharel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'idcurso': idcurso,
      'capa': capa,
      'nome': nome,
      'ADM': adm,
      'sobrenome': sobrenome,
      'anotacao': anotacao,
      'Bacharel': bacharel,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.idcurso == e2?.idcurso &&
        e1?.capa == e2?.capa &&
        e1?.nome == e2?.nome &&
        e1?.adm == e2?.adm &&
        e1?.sobrenome == e2?.sobrenome &&
        e1?.anotacao == e2?.anotacao &&
        e1?.bacharel == e2?.bacharel;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.idcurso,
        e?.capa,
        e?.nome,
        e?.adm,
        e?.sobrenome,
        e?.anotacao,
        e?.bacharel
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
