import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFECD5BE),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Text(
                    'CHUBA MAKAN',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF101213),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Text(
                  'Cooking App',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/logo2.png',
                    width: 384,
                    height: 328,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 5),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('SignUp');
                  },
                  text: 'Create Account',
                  options: FFButtonOptions(
                    width: 347,
                    height: 52,
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF7D5136),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.black,
                          letterSpacing: 0.0,
                        ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional(0, 0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 349,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE9D0),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 44,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFECD5BE),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'or',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFFFFE9D0),
                              fontSize: 15,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('SignIn');
                },
                text: 'Sign In',
                options: FFButtonOptions(
                  width: 347,
                  height: 52,
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: Color(0xFFFFE9D0),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.black,
                        letterSpacing: 0.0,
                      ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
