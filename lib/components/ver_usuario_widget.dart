import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ver_usuario_model.dart';
export 'ver_usuario_model.dart';

class VerUsuarioWidget extends StatefulWidget {
  const VerUsuarioWidget({
    super.key,
    required this.verUSUARIO,
  });

  final DocumentReference? verUSUARIO;

  @override
  State<VerUsuarioWidget> createState() => _VerUsuarioWidgetState();
}

class _VerUsuarioWidgetState extends State<VerUsuarioWidget> {
  late VerUsuarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerUsuarioModel());

    _model.oonValue1 = false;
    _model.oonValue2 = false;
    _model.oonValue3 = true;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget!.verUSUARIO!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xF09C9C9C),
                ),
              ),
            ),
          );
        }

        final bottomSheetEditUsersRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 375.0,
          decoration: BoxDecoration(
            color: Color(0xFF0B0D0F),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(
                  0.0,
                  -3.0,
                ),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    bottomSheetEditUsersRecord.photoUrl,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    bottomSheetEditUsersRecord.nome,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    bottomSheetEditUsersRecord.email,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFFBACCD7),
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (bottomSheetEditUsersRecord.bacharel == true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Desativar',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Switch.adaptive(
                              value: _model.oonValue1!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.oonValue1 = newValue!);
                                if (newValue!) {
                                  await widget!.verUSUARIO!
                                      .update(createUsersRecordData(
                                    bacharel: false,
                                  ));
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Bacharel desativado',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFF7),
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor: Color(0xFF048331),
                                    ),
                                  );
                                }
                              },
                              activeColor: Color(0xFFF94C56),
                              activeTrackColor: Color(0xFFF94C56),
                              inactiveTrackColor: Color(0xFFBACCD7),
                              inactiveThumbColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (bottomSheetEditUsersRecord.bacharel == false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Bacharel',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Switch.adaptive(
                              value: _model.oonValue2!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.oonValue2 = newValue!);
                                if (newValue!) {
                                  await widget!.verUSUARIO!
                                      .update(createUsersRecordData(
                                    bacharel: true,
                                  ));
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Bacharel ativado',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFF7),
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor: Color(0xFF048331),
                                    ),
                                  );
                                }
                              },
                              activeColor: Color(0xFF00EA5B),
                              activeTrackColor: Color(0xFF00EA5B),
                              inactiveTrackColor: Color(0xFFBACCD7),
                              inactiveThumbColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (valueOrDefault<bool>(
                        currentUserDocument?.bacharel, false) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (bottomSheetEditUsersRecord.bacharel == true)
                                Text(
                                  'Ativo',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w200,
                                      ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (bottomSheetEditUsersRecord.bacharel == true)
                                Switch.adaptive(
                                  value: _model.oonValue3!,
                                  onChanged: bottomSheetEditUsersRecord.bacharel
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() =>
                                              _model.oonValue3 = newValue!);
                                        },
                                  activeColor:
                                      bottomSheetEditUsersRecord.bacharel
                                          ? Color(0xFF00EA5B)
                                          : Color(0xFF00EA5B),
                                  activeTrackColor:
                                      bottomSheetEditUsersRecord.bacharel
                                          ? Color(0xFF00EA5B)
                                          : Color(0xFF00EA5B),
                                  inactiveTrackColor: Color(0xFFBACCD7),
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
