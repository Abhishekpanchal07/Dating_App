import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/modals/homepage_data.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:demoapp/widgets/profilecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Swipe { left, right, none }

class DragWidget extends StatefulWidget {
  final List<String>? userimages;
  final int index;
  final HomepageDetailsOfUser homepageDetailsOfUser;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;
  const DragWidget(
      {Key? key, required this.homepageDetailsOfUser,
       this.userimages,
       required this.index,
       required this.swipeNotifier,
       this.isLastCard = false,})
      : super(key: key);

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
              valueListenable: swipeNotifier,
              builder: (context, swipe, _) {
                return RotationTransition(
                  turns:
                  //  widget.swipeNotifier.value != Swipe.none
                  //   ? widget.swipeNotifier.value == Swipe.left
                   swipe != Swipe.none
                        ? swipe == Swipe.right
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                  child: Stack(children: [
                    ProfileCard(
                        homepageDetailsOfUser: widget.homepageDetailsOfUser,
                        userImages: widget.userimages,),
                  //  widget.swipeNotifier.value != Swipe.none
                  //       ? widget.swipeNotifier.value == Swipe.right
                   swipe != Swipe.none
                        ? swipe == Swipe.right
                            ? Positioned(
                                top: DimensionConstants.d190.h,
                                left: DimensionConstants.d150.w,
                                child: Transform.rotate(
                                  angle: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: ColorConstant.red,
                                        shape: BoxShape.circle),
                                    height: DimensionConstants.d80.h,
                                    width: DimensionConstants.d80.w,
                                    child: const Padding(
                                      padding: EdgeInsets.all(
                                          DimensionConstants.d15),
                                      child: ImageView(
                                        fit: BoxFit.cover,
                                        path: ImageConstants.heartIcon,
                                      ),
                                    ),
                                  ),
                                ))
                            : Positioned(
                                top: DimensionConstants.d190.h,
                                right: DimensionConstants.d150.w,
                                child: Transform.rotate(
                                  angle: 0,
                                  child: Card(
                                    shape: const CircleBorder(),
                                    elevation: DimensionConstants.d5,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: ColorConstant.textcolor,
                                          shape: BoxShape.circle),
                                      height: DimensionConstants.d80.h,
                                      width: DimensionConstants.d80.w,
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            DimensionConstants.d15),
                                        child: ImageView(
                                          fit: BoxFit.cover,
                                          path: ImageConstants.crossMarkIcon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                        : const SizedBox.shrink(),
                  ]),
                );
              }),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          // When Draggable widget is dragged right
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Swipe.right;
          }
          // When Draggable widget is dragged left
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          swipeNotifier.value = Swipe.none;
        },
        childWhenDragging: Container(
          color: Colors.transparent,
        ),
        child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (BuildContext context, Swipe swipe, Widget? child) {
              return Stack(
                children: [
                  ProfileCard(homepageDetailsOfUser: widget.homepageDetailsOfUser,
                  userImages: widget.userimages,),
                  // heck if this is the last card and Swipe is not equal to Swipe.none
                  swipe != Swipe.none && widget.isLastCard
                      ? swipe == Swipe.right
                          ? Positioned(
                              top: DimensionConstants.d190.h,
                              left: DimensionConstants.d150.w,
                              child: Transform.rotate(
                                angle: 0,
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: ColorConstant.red,
                                        shape: BoxShape.circle),
                                    height: DimensionConstants.d80.h,
                                    width: DimensionConstants.d80.w,
                                    child: const Padding(
                                      padding: EdgeInsets.all(
                                          DimensionConstants.d15),
                                      child: ImageView(
                                        fit: BoxFit.cover,
                                        path: ImageConstants.heartIcon,
                                      ),
                                    ),
                                  ),
                              ),
                            )
                          : Positioned(
                              top: DimensionConstants.d190.h,
                              right: DimensionConstants.d150.w,
                              child: Transform.rotate(
                                angle: 0,
                                child: Card(
                                  shape: const CircleBorder(),
                                  elevation: DimensionConstants.d5,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: ColorConstant.textcolor,
                                        shape: BoxShape.circle),
                                    height: DimensionConstants.d80.h,
                                    width: DimensionConstants.d80.w,
                                    child: const Padding(
                                      padding: EdgeInsets.all(
                                          DimensionConstants.d15),
                                      child: ImageView(
                                        fit: BoxFit.cover,
                                        path: ImageConstants.crossMarkIcon,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                      : const SizedBox.shrink(),
                ],
              );
            }),
      ),
    );
  }
}
