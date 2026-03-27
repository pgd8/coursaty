import 'package:camera/camera.dart';
import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:coursaty/features/user/prsentation/view/widgets/face_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<UserCubit>();
    cubit.initializeFaceDetector();
    cubit.initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<UserCubit>().closeCamera();
        context.pop();
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constants.kToolBarHeight),
          child: AppBarCustom(
            title: LocaleKeys.kExam.tr(),
            isHome: false,
            onBackPressed: () {
              context.read<UserCubit>().closeCamera();
              context.pop();
            },
          ),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            final cubit = context.read<UserCubit>();
            if (state is CameraLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CameraOpened ||
                state is FaceDetected ||
                state is FaceNotDetected) {
              return Column(
                children: [
                  Container(
                    height: 200.h,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CameraPreview(cubit.cameraController!),
                        if (state
                            is FaceDetected) // this state only when face is detected to create the rounded box
                          CustomPaint(
                            painter: FacePainter(
                              faces: state.faces,
                              imageSize: state.imageSize,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
