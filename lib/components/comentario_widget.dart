import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comentario_model.dart';
export 'comentario_model.dart';

class ComentarioWidget extends StatefulWidget {
  const ComentarioWidget({
    super.key,
    required this.comentar,
  });

  final DocumentReference? comentar;

  @override
  State<ComentarioWidget> createState() => _ComentarioWidgetState();
}

class _ComentarioWidgetState extends State<ComentarioWidget> {
  late ComentarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComentarioModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Stack(
              children: [
                StreamBuilder<ComentariosRecord>(
                  stream: ComentariosRecord.getDocument(widget!.comentar!),
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

                    final cardCommentComentariosRecord = snapshot.data!;

                    return Container(
                      width: 400.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF0B0D0F),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 60.0, 12.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (cardCommentComentariosRecord.aula ==
                                  cardCommentComentariosRecord.aula)
                                StreamBuilder<List<ComentariosRecord>>(
                                  stream: queryComentariosRecord(
                                    queryBuilder: (comentariosRecord) =>
                                        comentariosRecord
                                            .where(
                                              'aula',
                                              isEqualTo:
                                                  cardCommentComentariosRecord
                                                      .aula,
                                            )
                                            .orderBy('data', descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xF09C9C9C),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ComentariosRecord>
                                        listViewComentariosRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        12.0,
                                        0,
                                        12.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewComentariosRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewComentariosRecord =
                                            listViewComentariosRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/811/600',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Text(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.nome,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Text(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.sobrenome,
                                                                    ''),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                            "relative",
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 36.0,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    icon: Icon(
                                                      Icons.keyboard_control,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                              Text(
                                                listViewComentariosRecord
                                                    .comentario,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Escreva um comentário...',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF95A1AC),
                                letterSpacing: 0.0,
                              ),
                      alignLabelWithHint: true,
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFF12161A),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 32.0, 16.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    maxLines: 8,
                    minLines: 4,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Comentários',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: StreamBuilder<List<TeologiaRecord>>(
            stream: queryTeologiaRecord(
              singleRecord: true,
            ),
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
              List<TeologiaRecord> buttonTeologiaRecordList = snapshot.data!;
              final buttonTeologiaRecord = buttonTeologiaRecordList.isNotEmpty
                  ? buttonTeologiaRecordList.first
                  : null;

              return FFButtonWidget(
                onPressed: () async {
                  await ComentariosRecord.collection
                      .doc()
                      .set(createComentariosRecordData(
                        comentario: _model.textController.text,
                        aula: buttonTeologiaRecord?.reference.id,
                        data: getCurrentTimestamp,
                      ));
                },
                text: 'Enviar',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFE8790A),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
