import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_ler/nav_bar_ler_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assistir4_model.dart';
export 'assistir4_model.dart';

class Assistir4Widget extends StatefulWidget {
  const Assistir4Widget({
    super.key,
    required this.filme4,
  });

  final DocumentReference? filme4;

  @override
  State<Assistir4Widget> createState() => _Assistir4WidgetState();
}

class _Assistir4WidgetState extends State<Assistir4Widget> {
  late Assistir4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Assistir4Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF0B0D0F),
      appBar: AppBar(
        backgroundColor: Color(0xFF111417),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 3.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 68.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 64.0),
                    child: StreamBuilder<ListaFilmes4Record>(
                      stream: ListaFilmes4Record.getDocument(widget!.filme4!),
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

                        final columnListaFilmes4Record = snapshot.data!;

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FlutterFlowVideoPlayer(
                                path: columnListaFilmes4Record.filme,
                                videoType: VideoType.network,
                                width: double.infinity,
                                height: 225.0,
                                autoPlay: false,
                                looping: false,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  columnListaFilmes4Record.nome,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 0.0),
                                child: Text(
                                  columnListaFilmes4Record.p1,
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 5.0, 16.0, 0.0),
                                child: Text(
                                  columnListaFilmes4Record.p2,
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 5.0, 16.0, 0.0),
                                child: Text(
                                  columnListaFilmes4Record.p3,
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navBarLerModel,
                updateCallback: () => safeSetState(() {}),
                child: NavBarLerWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
